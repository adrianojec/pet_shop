import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BebasNeueText extends StatelessWidget {
  BebasNeueText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.color,
  }) : super(key: key);

  final String text;
  final double fontSize;
  FontWeight? fontWeight;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }
}
