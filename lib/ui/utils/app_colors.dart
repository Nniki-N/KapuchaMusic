import 'package:flutter/material.dart';

class AppColors {
  static final pink = HexColor.fromHex('#FC5185');
  static final blue = HexColor.fromHex('#3FC1C9');
  static final darkBlue = HexColor.fromHex('#364F6B');
  static final lightGreyBg = HexColor.fromHex('#F5F5F5');
  static final greyMenuIcons = HexColor.fromHex('#929FAD');
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
