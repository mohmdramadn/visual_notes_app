import 'package:flutter/material.dart';
import 'package:visual_notes_app/constants/string_constants.dart' as string_constants;
import 'package:visual_notes_app/ui/widgets/save_note_btn.dart';

class NewNotePage extends StatelessWidget {
  NewNotePage({Key? key}) : super(key: key);
  final _contentController = TextEditingController();
  final _titleController = TextEditingController();
  late String _filterValue = '';
  final List<String> dropdownTimeList = [
    'Closed',
    'Open',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new note'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/images/test_pic.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Status',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff525453)),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          isDense: true,
                          iconSize: 20,
                          hint: _filterValue == ''
                              ? Text('Choose status')
                              : Text(_filterValue),
                          items: dropdownTimeList.map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            _filterValue = value.toString();
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
                height: 70,
                label: string_constants.saveText,
                icon: null,
                onPressed: (){},
                color: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
