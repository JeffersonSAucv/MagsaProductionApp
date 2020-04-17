import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color(0xffF7D73F),
      child: Stack(
        children: <Widget>[
          _HeaderTriangularPainter(),
          _HeaderTrianguloInvertidoPainter(),
        ],
      ),
    );
  }
}

class _HeaderTrianguloInvertidoPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalInvertidoPainter(),
      ),
    );
  }
}

class _HeaderDiagonalInvertidoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //lapiz

    // Propiedades Lapiz

    paint.color = Color(0xffFFD200);
    paint.style = PaintingStyle.fill;
    //paint.strokeWidth = 20;

    final path = Path();

    path.moveTo(size.width * 0.10, 0);
    path.lineTo(size.width * 0.9, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    //  path.moveTo( size.width * 0.9, 1 );

    canvas.drawShadow(path.shift(Offset(0, 6)), Colors.black.withOpacity(0.9), 10.0, true); //esto va primero si quieres sombras
    canvas.drawPath(path, paint); //pintas tu canvas
    //canvas.drawShadow(path, Colors.black45, 3.0, false);

   
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _HeaderTriangularPainter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint(); //lapiz

    // Propiedades Lapiz

    paint.color = Color(0xff333333);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(
        0,
        size.height *
            0.1); // no me muevo del punto inicila porque nempeinza  en 0,0
    path.lineTo(size.width * 0.83, size.height);
    path.lineTo(0, size.height);
    //path.lineTo(0, 0);

    canvas.drawPath(path, paint);
 
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
