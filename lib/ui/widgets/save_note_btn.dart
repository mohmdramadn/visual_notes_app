import 'package:flutter/material.dart';

class SaveNoteButton extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;
  final double? height;
  final bool enabled;
  final Widget? icon;
  final Color? color;

   SaveNoteButton(
      {Key? key, required this.label,
        required this.onPressed,
        required this.height,
        this.enabled = true,
        required this.color, this.icon,
        }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          elevation: 4.0,
          shadowColor: Colors.black,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: enabled ? Colors.blue : Colors.grey[500],
          ),
          child: Center(
            child: Stack(
              children: [
                Center(child: icon),
                Center(
                  child: Text(
                    label!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
