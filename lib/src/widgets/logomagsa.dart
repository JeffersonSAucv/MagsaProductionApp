import 'package:flutter/material.dart';
import 'package:repartos_magsa/src/utils/responsive.dart';

class LogoMagsa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Image.asset(
      'assets/LogoMagsa.png',
      width: responsive.widthp(70),
    );
  }
}
