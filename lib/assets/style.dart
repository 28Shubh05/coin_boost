import 'dart:ui';

import 'package:google_fonts/google_fonts.dart';

class AppWidth{
  static headingTextFieldStyle(){
    return GoogleFonts.robotoMono(
        color: const Color(0xffF7931A),
        fontSize: 40,
      fontWeight: FontWeight.w700
    );
  }

  static subHeadingTextFieldStyle(){
    return GoogleFonts.robotoMono(
        color: const Color(0xffF7931A),
        fontSize: 32,
        fontWeight: FontWeight.w700
    );
  }
}