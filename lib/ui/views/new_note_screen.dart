import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gallery_saver/gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:visual_notes_app/constants/string_constants.dart'
    as string_constants;
import 'package:visual_notes_app/logic/notes_bloc.dart';
import 'package:visual_notes_app/logic/notes_event.dart';
import 'package:visual_notes_app/ui/widgets/save_note_btn.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final _contentController = TextEditingController();

  final _titleController = TextEditingController();

  late String _filterValue = '';

  final List<String> dropdownTimeList = [
    'Closed',
    'Open',
  ];

  File? cameraImage;
  var picker = ImagePicker();

  Future<void> getImagePicker({required source}) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {

      setState(() {
        // This package suppose to save photo when taken with camera to the device in order for the
        // Image.file() widget be able to load the photo from an existing location on the device
        // but I face som errors with it while implementing it before the deadline
        ///GallerySaver.saveImage(pickedFile.path);
        cameraImage = File(pickedFile.path);
      });
    } else {
      const snackBar = SnackBar(
        content: Text("No image selected"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(string_constants.newNoteScreenTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              Permission.camera.request();
              getImagePicker(source: ImageSource.camera);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: (cameraImage != null)
                      ? Image.file(cameraImage!)
                      : IconButton(
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 100.0,
                          ),
                          onPressed: () {
                            Permission.camera.request();
                            getImagePicker(source: ImageSource.camera);
                          },
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Status',
                                  style: TextStyle(
                                      fontSize: 20, color: Color(0xff525453)),
                                ),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    isDense: true,
                                    iconSize: 20,
                                    hint: _filterValue == ''
                                        ? const Text('Choose status')
                                        : Text(_filterValue),
                                    items: dropdownTimeList.map((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        _filterValue = value.toString();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            maxLines: null,
                            controller: _titleController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Title',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            textInputAction: TextInputAction.newline,
                            maxLines: null,
                            controller: _contentController,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              hintText: 'Description',
                            ),
                          ),
                        ),
                        SaveNoteButton(
                          enabled: _titleController.text != ''
                              ? _contentController.text != ''
                                  ? true
                                  : false
                              : false,
                          height: 70,
                          label: string_constants.saveText,
                          onPressed: () {
                            print('ok');
                            // final imageBytes = cameraImage?.readAsBytesSync();
                            // String base64Encode(List<int> bytes) => base64.encode(bytes);
                            BlocProvider.of<NotesBloc>(context).add(
                              AddNewNoteEvent(
                                status: _filterValue,
                                title: _titleController.text,
                                desc: _contentController.text,
                                pic: cameraImage.toString(),
                                time: DateTime.now(),
                              ),
                            );
                          },
                          color: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
