import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(this.text, this.onTap, {super.key});
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        ),
        foregroundColor: const MaterialStatePropertyAll(Colors.white),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        // make the text centered
        textAlign: TextAlign.center,
      ),
    );
  }
}
