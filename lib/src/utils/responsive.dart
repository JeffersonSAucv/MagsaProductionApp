import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive{

  double width;
  double heigth;
  double inch;


  Responsive(BuildContext context){

    final size = MediaQuery.of(context).size;
    width = size.width;
    heigth = size.height;
    inch = math.sqrt(math.pow(width, 2) + math.pow(heigth, 2));
  }

  double widthp(double percent){
    return width * percent / 100 ;
  }
  
  double heigthp(double percent){
    return heigth * percent / 100 ;
  }

   double inchp(double percent){
    return heigth * percent / 100 ;
  }

  
}