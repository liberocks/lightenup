import 'dart:ui';

import 'package:hexcolor/hexcolor.dart';

class ThemeColor {
  static Color xf8f8f8 = HexColor('#f8f8f8');

  static Color black = HexColor('#000000');
  static Color white = HexColor('#ffffff');
  static Color slate = HexColor('#1d1b20');
  static Color gray = HexColor('#111111');
  static Color pale = HexColor('#49454f');

  static Color primary100 = HexColor('#fef7ff');
  static Color primary300 = HexColor('#cdb7fd');
  static Color primary500 = HexColor('#6750a4');

  static Color secondary300 = HexColor('#80def8');

  static Color gradientStart = ThemeColor.primary300;
  static Color gradientEnd = ThemeColor.secondary300;
}
