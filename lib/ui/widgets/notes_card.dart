import 'package:flutter/material.dart';
import 'package:visual_notes_app/ui/widgets/delete_dialog.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({Key? key}) : super(key: key);

  //TODO: make the strings come from th DB
  final String _noteTitle = 'Title';
  final String _noteDesc =
      'Description for the note and testing the multiline with this string adding more word to see what will happen with the string';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 4,
        shadowColor: Colors.grey,
        child: ListTile(
          trailing: PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'edit',
                  child: Row(
                    children: const [
                      Expanded(flex: 2, child: Text('Edit')),
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: const [
                      Expanded(flex: 2, child: Text('Delete')),
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                    ],
                  ),
                )
              ];
            },
            onSelected: (String value) {
              //TODO: make them navigate to the edit menu or delete item
              if (value == 'edit')
                print('1');
              else {
                showDialog(
                    barrierDismissible: true,
                    context: context,
                    builder: (BuildContext context) {
                      //TODO: add functionality to this dialog
                      return DeleteDialog(
                        onYesPressed: () {
                          print('yes is pressed');
                        },
                        onCancelPressed: () {
                          print('cancel is pressed');
                        },
                      );
                    });
              }
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          tileColor: Colors.grey[350],
          leading: SizedBox(
            height: 100,
            child: Image.asset(
              'assets/images/test_pic.jpg',
              fit: BoxFit.contain,
            ),
          ),
          title: Text(
            _noteTitle,
          ),
          subtitle: Text(
            _noteDesc,
          ),
          contentPadding: const EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
