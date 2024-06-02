import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

textPoppins(
    {required String text,
    required Color color,
    required bool isTile,
    required double fontSize}) {
  return Text(
    text,
    style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: isTile ? FontWeight.bold : FontWeight.normal),
  );
}

textRoboro(
    {required String text,
    required Color color,
    required bool isTile,
    required double fontSize}) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        fontSize: fontSize,
        color: color,
        fontWeight: isTile ? FontWeight.bold : FontWeight.normal),
  );
}