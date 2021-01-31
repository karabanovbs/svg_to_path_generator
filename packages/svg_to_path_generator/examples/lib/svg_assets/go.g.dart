// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go.dart';

// **************************************************************************
// SvgToPathGenerator
// **************************************************************************

// SvgToPath for assets/GO.svg

// <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
//     <path fill-rule="evenodd" clip-rule="evenodd"
//           d="M22 4C22 5.65685 20.6569 7 19 7C17.6938 7 16.5825 6.16519 16.1707 5H7C5.34315 5 4 6.34315 4 8V8.25926C4 9.91611 5.34315 11.2593 7 11.2593H17.1296C19.8195 11.2593 22 13.4398 22 16.1296C22 18.8195 19.8195 21 17.1296 21H15.4142L15.7071 21.2929C16.0977 21.6834 16.0977 22.3166 15.7071 22.7071C15.3166 23.0976 14.6834 23.0976 14.2929 22.7071L11.5858 20L14.2929 17.2929C14.6834 16.9024 15.3166 16.9024 15.7071 17.2929C16.0977 17.6834 16.0977 18.3166 15.7071 18.7071L15.4142 19H17.1296C18.7149 19 20 17.7149 20 16.1296C20 14.5444 18.7149 13.2593 17.1296 13.2593H7C4.23858 13.2593 2 11.0207 2 8.25926V8C2 5.23858 4.23858 3 7 3H16.1707C16.5825 1.83481 17.6938 1 19 1C20.6569 1 22 2.34315 22 4ZM5 23C6.65685 23 8 21.6569 8 20C8 18.3431 6.65685 17 5 17C3.34315 17 2 18.3431 2 20C2 21.6569 3.34315 23 5 23Z"
//           fill="white"/>
// </svg>
//

class _GoSvgPainter extends CustomPainter {
  final originalHeight = 24;
  final originalWidth = 24;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.scale(size.width / 24, size.height / 24);

    path0(canvas, size);
  }

  path0(Canvas canvas, Size size) {
    Paint paint0 = Paint();
    paint0.color = Color.fromARGB(255, 255, 255, 255);
    var path0 = Path();
    path0.fillType = PathFillType.evenOdd;
    path0.moveTo(22.0, 4.0);
    path0.cubicTo(22.0, 5.65685, 20.6569, 7.0, 19.0, 7.0);
    path0.cubicTo(17.6938, 7.0, 16.5825, 6.16519, 16.1707, 5.0);
    path0.lineTo(7.0, 5.0);
    path0.cubicTo(5.34315, 5.0, 4.0, 6.34315, 4.0, 8.0);
    path0.lineTo(4.0, 8.25926);
    path0.cubicTo(4.0, 9.91611, 5.34315, 11.2593, 7.0, 11.2593);
    path0.lineTo(17.1296, 11.2593);
    path0.cubicTo(19.8195, 11.2593, 22.0, 13.4398, 22.0, 16.1296);
    path0.cubicTo(22.0, 18.8195, 19.8195, 21.0, 17.1296, 21.0);
    path0.lineTo(15.4142, 21.0);
    path0.lineTo(15.7071, 21.2929);
    path0.cubicTo(16.0977, 21.6834, 16.0977, 22.3166, 15.7071, 22.7071);
    path0.cubicTo(15.3166, 23.0976, 14.6834, 23.0976, 14.2929, 22.7071);
    path0.lineTo(11.5858, 20.0);
    path0.lineTo(14.2929, 17.2929);
    path0.cubicTo(14.6834, 16.9024, 15.3166, 16.9024, 15.7071, 17.2929);
    path0.cubicTo(16.0977, 17.6834, 16.0977, 18.3166, 15.7071, 18.7071);
    path0.lineTo(15.4142, 19.0);
    path0.lineTo(17.1296, 19.0);
    path0.cubicTo(18.7149, 19.0, 20.0, 17.7149, 20.0, 16.1296);
    path0.cubicTo(20.0, 14.5444, 18.7149, 13.2593, 17.1296, 13.2593);
    path0.lineTo(7.0, 13.2593);
    path0.cubicTo(4.23858, 13.2593, 2.0, 11.0207, 2.0, 8.25926);
    path0.lineTo(2.0, 8.0);
    path0.cubicTo(2.0, 5.23858, 4.23858, 3.0, 7.0, 3.0);
    path0.lineTo(16.1707, 3.0);
    path0.cubicTo(16.5825, 1.83481, 17.6938, 1.0, 19.0, 1.0);
    path0.cubicTo(20.6569, 1.0, 22.0, 2.34315, 22.0, 4.0);
    path0.close();
    path0.moveTo(5.0, 23.0);
    path0.cubicTo(6.65685, 23.0, 8.0, 21.6569, 8.0, 20.0);
    path0.cubicTo(8.0, 18.3431, 6.65685, 17.0, 5.0, 17.0);
    path0.cubicTo(3.34315, 17.0, 2.0, 18.3431, 2.0, 20.0);
    path0.cubicTo(2.0, 21.6569, 3.34315, 23.0, 5.0, 23.0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(_GoSvgPainter oldDelegate) => false;
}

class _GoSvg extends StatelessWidget {
  final Widget child;
  final Color color;

  const _GoSvg({
    Key key,
    this.child,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildFiltered(
      context,
      child: AspectRatio(
        aspectRatio: 24 / 24,
        child: CustomPaint(
          painter: _GoSvgPainter(),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget buildFiltered(BuildContext context, {Widget child}) {
    if (color != null) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        child: child,
      );
    }
    return child;
  }
}
