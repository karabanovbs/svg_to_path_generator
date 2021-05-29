// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'read.dart';

// **************************************************************************
// SvgToPathGenerator
// **************************************************************************

// SvgToPath for assets/read.svg

// <svg width="18" height="10" viewBox="0 0 18 10" fill="none" xmlns="http://www.w3.org/2000/svg">
// <path fill-rule="evenodd" clip-rule="evenodd" d="M1.5 4.5L0 6L4 10L13 1.5L11.5 0L4 7L1.5 4.5Z" fill="white"/>
// <path fill-rule="evenodd" clip-rule="evenodd" d="M9 7L7.5 8.5L9 10L18 1.5L16.5 0L9 7Z" fill="white"/>
// </svg>
//

class _ReadSvgPainter extends CustomPainter {
  final originalHeight = 10;
  final originalWidth = 18;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 18, size.height / 10);

    path0(canvas, size);
    path1(canvas, size);
  }

  path0(Canvas canvas, Size size) {
    Paint paint0 = Paint();
    paint0.color = Color.fromARGB(255, 255, 255, 255);
    var path0 = Path();
    path0.fillType = PathFillType.evenOdd;
    path0.moveTo(1.5, 4.5);
    path0.lineTo(0.0, 6.0);
    path0.lineTo(4.0, 10.0);
    path0.lineTo(13.0, 1.5);
    path0.lineTo(11.5, 0.0);
    path0.lineTo(4.0, 7.0);
    path0.lineTo(1.5, 4.5);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  path1(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    paint1.color = Color.fromARGB(255, 255, 255, 255);
    var path1 = Path();
    path1.fillType = PathFillType.evenOdd;
    path1.moveTo(9.0, 7.0);
    path1.lineTo(7.5, 8.5);
    path1.lineTo(9.0, 10.0);
    path1.lineTo(18.0, 1.5);
    path1.lineTo(16.5, 0.0);
    path1.lineTo(9.0, 7.0);
    path1.close();

    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(_ReadSvgPainter oldDelegate) => false;
}

class _ReadSvg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 18 / 10,
      child: CustomPaint(
        painter: _ReadSvgPainter(),
      ),
    );
  }
}
