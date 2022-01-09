import 'package:flutter/material.dart';
import 'package:visual_notes_app/constants/string_constants.dart'
    as string_constants;

class DeleteDialog extends StatelessWidget {
  final VoidCallback onYesPressed;
  final VoidCallback onCancelPressed;

  const DeleteDialog(
      {Key? key, required this.onYesPressed, required this.onCancelPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(string_constants.deleteTitle),
      content: const Text(string_constants.deleteQuestion),
      actions: [
        TextButton(
          onPressed: onCancelPressed,
          child: const Text(string_constants.cancelAnswer,style: TextStyle(
            color: Colors.grey
          ),),
        ),
        TextButton(
          onPressed: onYesPressed,
          child: const Text(string_constants.yesAnswer,style: TextStyle(
              color: Colors.red
          ),),
        ),
      ],
    );
  }
}
