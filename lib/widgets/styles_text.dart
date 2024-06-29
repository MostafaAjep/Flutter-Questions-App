import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 24,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.visible,
    );
  }
}
