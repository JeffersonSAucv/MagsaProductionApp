import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:repartos_magsa/utils/responsive.dart';

//CAMPOS DEL TEXTFORM FIELD

class CampoFieldCustom extends StatelessWidget {
  final TextFormField textformfield;
  final IconData icon;

  const CampoFieldCustom(
      {@required this.textformfield, this.icon = FontAwesomeIcons.personBooth});
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.heigthp(2)),
      width: responsive.heigthp(45),
      height: responsive.widthp(15),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  //decoration: BoxDecoration( border: Border.all()),
                  margin:
                      EdgeInsets.symmetric(horizontal: responsive.widthp(5)),
                  child: FaIcon(
                    icon,
                    size: responsive.heigthp(4),
                    color: Colors.grey[600],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  //decoration: BoxDecoration( border: Border.all()),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(right: responsive.widthp(5)),
                  child: textformfield,
                ))
          ],
        ),
      ),
    );
  }
}