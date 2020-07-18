import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repartos_magsa/src/utils/responsive.dart';

class AppBarWelcome extends StatelessWidget {
  final String texto;
  final Function ontap;

  const AppBarWelcome({this.texto = '', this.ontap});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: responsive.heigthp(10),
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: ontap,
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: responsive.widthp(5)),
                      child: FaIcon(FontAwesomeIcons.chevronLeft)),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Text(
                    texto,
                    style: TextStyle(
                        fontSize: responsive.inchp(3),
                        fontFamily: 'Rubik Medium',
                        fontWeight: FontWeight.w200),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
