// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// SvgToPathGenerator
// **************************************************************************

// SvgToPath for assets/Card.svg

// <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
//     <path d="M5 7H4C2.89543 7 2 7.89543 2 9V19C2 20.1046 2.89543 21 4 21H20C21.1046 21 22 20.1046 22 19V9C22 7.89543 21.1046 7 20 7H19"
//           stroke="white" stroke-width="2" stroke-linecap="round"/>
//     <circle r="2" transform="matrix(1 0 0 -1 12 14)" stroke="white" stroke-width="2" stroke-linecap="round"/>
//     <path  d="M14.3353 3L16 5M16 5L14.3353 7M16 5L11 5C9.89543 5 9 5.89543 9 7V9.5" stroke="white" stroke-width="2"
//           stroke-linecap="round"/>
// </svg>
//

class _CardSvgPainter extends CustomPainter {
  final originalHeight = 24;
  final originalWidth = 24;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);

    path0(canvas, size);
    circle1(canvas, size);
    path2(canvas, size);
  }

  path0(Canvas canvas, Size size) {
    Paint paint0 = Paint();
    paint0.style = PaintingStyle.stroke;
    paint0.color = Color.fromARGB(255, 255, 255, 255);
    paint0.strokeWidth = 2;
    paint0.strokeCap = StrokeCap.round;
    var path0 = Path();
    path0.moveTo(5.0, 7.0);
    path0.lineTo(4.0, 7.0);
    path0.cubicTo(2.89543, 7.0, 2.0, 7.89543, 2.0, 9.0);
    path0.lineTo(2.0, 19.0);
    path0.cubicTo(2.0, 20.1046, 2.89543, 21.0, 4.0, 21.0);
    path0.lineTo(20.0, 21.0);
    path0.cubicTo(21.1046, 21.0, 22.0, 20.1046, 22.0, 19.0);
    path0.lineTo(22.0, 9.0);
    path0.cubicTo(22.0, 7.89543, 21.1046, 7.0, 20.0, 7.0);
    path0.lineTo(19.0, 7.0);

    canvas.drawPath(path0, paint0);
  }

  circle1(Canvas canvas, Size size) {
    final Rect oval1 = Rect.fromCircle(center: Offset(0, 0), radius: 2);
    Paint paint1 = Paint();
    paint1.style = PaintingStyle.stroke;
    paint1.color = Color.fromARGB(255, 255, 255, 255);
    paint1.strokeWidth = 2;
    paint1.strokeCap = StrokeCap.round;
    var path1 = Path()..addOval(oval1);
    path1 = path1.transform(Matrix4.identity()
        .multiplied(Matrix4(1, 0, 0.0, 0.0, 0, -1, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0,
            12, 14, 0.0, 1.0))
        .storage);
    canvas.drawPath(path1, paint1);
  }

  path2(Canvas canvas, Size size) {
    Paint paint2 = Paint();
    paint2.style = PaintingStyle.stroke;
    paint2.color = Color.fromARGB(255, 255, 255, 255);
    paint2.strokeWidth = 2;
    paint2.strokeCap = StrokeCap.round;
    var path2 = Path();
    path2.moveTo(14.3353, 3.0);
    path2.lineTo(16.0, 5.0);
    path2.moveTo(16.0, 5.0);
    path2.lineTo(14.3353, 7.0);
    path2.moveTo(16.0, 5.0);
    path2.lineTo(11.0, 5.0);
    path2.cubicTo(9.89543, 5.0, 9.0, 5.89543, 9.0, 7.0);
    path2.lineTo(9.0, 9.5);

    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(_CardSvgPainter oldDelegate) => false;
}

class _CardSvg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 24 / 24,
      child: CustomPaint(
        painter: _CardSvgPainter(),
      ),
    );
  }
}
