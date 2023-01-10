import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static Color bgColor = const Color(0xffffffff);
  static Color mainColor = const Color(0xff000000);
  static Color accentColor = const Color(0xFFB4A9A3);
  static Color selected = const Color(0xFFC9B9B0);

  // Setting the Cards different Color

  static List<Color> cardsColor = [
    const Color(0xFFe8d1c5),
    const Color(0xFFeddcd2),
    const Color(0xFFfff1e6),
    const Color(0xFFF8F1EE),
    const Color(0xFFeeddd3),
    const Color(0xFFEDDAD1),
    const Color(0xFFEFDFD6),
    const Color(0xFFF1E3DC),
  ];

  // Setting the text style

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.bold);

  static TextStyle dateTitle =
      GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.w500);
}
