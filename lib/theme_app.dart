import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApp {
  late _TextStyle textStyle;

  ThemeApp() {
    // Constructor Body
    textStyle = _TextStyle();
  }
}

class _TextStyle {
  TextStyle get blackSize18Bold {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 18,);
  }


  TextStyle get blackSize16Bold {
    return GoogleFonts.openSans(
        fontWeight: FontWeight.bold, fontSize: 16,);
  }

  TextStyle get blackSize14Bold {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.bold, fontSize: 14,);
  }

  TextStyle get black87Size16Normal {
    return GoogleFonts.openSans(
        fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w400);
  }

  TextStyle get black87Size14SemiBold {
    return GoogleFonts.openSans(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w600);
  }

  TextStyle get black87Size14Normal {
    return GoogleFonts.openSans(
        fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400);
  }

}
