import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return resetButton(onPressed);
  }
}

Container resetButton(VoidCallback onPressed) {
  return Container(
    alignment: Alignment.centerRight,
    child: CircleAvatar(
      radius: 25,
      backgroundColor: Colors.teal,
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.restart_alt, size: 29),
        ),
      ),
    ),
  );
}
