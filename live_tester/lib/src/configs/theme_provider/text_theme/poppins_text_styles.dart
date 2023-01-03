import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _normalPoppins = GoogleFonts.poppins(
  fontStyle: FontStyle.normal,
  textBaseline: TextBaseline.alphabetic,
);

final regularPoppins = _normalPoppins.copyWith(
  fontWeight: FontWeight.normal,
);

final mediumPoppins = _normalPoppins.copyWith(
  fontWeight: FontWeight.w500,
);
