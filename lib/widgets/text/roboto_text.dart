import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RobotoText extends StatelessWidget {
  RobotoText({
    Key? key,
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.color,
    this.textAlign,
    this.softWrap,
    this.maxLines,
  }) : super(key: key);

  final String text;
  final double fontSize;
  FontWeight? fontWeight;
  double? letterSpacing;
  Color? color;
  TextAlign? textAlign;
  bool? softWrap;
  int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      maxLines: maxLines,
      style: GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        color: color,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
