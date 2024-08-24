import 'package:flutter/material.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.indigo;
  static const String baslikText = "Ortalama Hesapla";
  static final baslikStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);

  // static final baslikStyle = GoogleFonts.quicksand(
  //   fontSize: 24,
  //   color: anaRenk,
  //   fontWeight: FontWeight.w900,
  // );

  static const BorderRadius borderRadius =
      BorderRadius.all(Radius.circular(20));
  static final ortalamaStyle =
      TextStyle(fontSize: 55, fontWeight: FontWeight.w800, color: anaRenk);

  static final ortalamGosterBodyStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w900, color: anaRenk);
  static final dropdownPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static final yatayPaddin8 = EdgeInsets.symmetric(horizontal: 8);
}
