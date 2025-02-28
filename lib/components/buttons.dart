import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.deepPurple),

      ),
      color: Colors.red[400],
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
