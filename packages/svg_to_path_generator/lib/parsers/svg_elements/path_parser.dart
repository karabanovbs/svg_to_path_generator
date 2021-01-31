import 'package:path_parsing/path_parsing.dart';
import 'package:svg_to_path_generator/parsers/common/color_parser.dart';
import 'package:svg_to_path_generator/parsers/common/stroke_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/svg_element_parser.dart';
import 'package:xml/xml.dart';

class PathParser implements SvgElementParser {
  final XmlElement _element;
  final String _elementId;

  PathParser(this._elementId, this._element);

  @override
  String paint() {
    StringPathProxy pathProxy = StringPathProxy('path$_elementId');
    writeSvgPathDataToPath(_element.getAttribute('d'), pathProxy);

    var color = ColorParser(_element.getAttribute('fill'));
    var colorStr = color.parse();

    String fillType;
    switch (_element.getAttribute('fill-rule')) {
      case 'evenodd':
        fillType = 'PathFillType.evenOdd';
        break;
      case 'nonzero':
        fillType = 'PathFillType.nonZero';
        break;
      default:
        fillType = '';
    }

    StringBuffer result = StringBuffer();

    result.writeln('Paint paint$_elementId = Paint();');
    if (colorStr != null) {
      result.writeln('paint$_elementId.color = ${color.parse()};');
    }

    var stroke = StrokeParser(
        _element.getAttribute('stroke'),
        _element.getAttribute('stroke-width'),
        _element.getAttribute('stroke-linecap'));

    if (stroke.isStroke) {
      result.writeln('paint$_elementId.style = PaintingStyle.stroke;');

      result.writeln('paint$_elementId.color = ${stroke.strokeColor};');

      if (stroke.strokeWidth != null) {
        result.writeln('paint$_elementId.strokeWidth = ${stroke.strokeWidth};');
      }

      if (stroke.strokeCap != null) {
        result.writeln('paint$_elementId.strokeCap = ${stroke.strokeCap};');
      }
    }

    result.writeln('var path$_elementId = Path();');

    if (fillType.isNotEmpty) {
      result.writeln('path$_elementId.fillType = $fillType;');
    }

    result.writeln(pathProxy.pathBuffer.toString());
    result.writeln('canvas.drawPath(path$_elementId, paint$_elementId);');

    return result.toString();
  }

  @override
  String get name => 'path${_elementId}';

  @override
  String get id => _elementId;
}

class StringPathProxy extends PathProxy {
  final String varName;

  StringPathProxy(this.varName, {StringBuffer? pathBuffer})
      : pathBuffer = pathBuffer ?? StringBuffer();

  final StringBuffer pathBuffer;

  @override
  void close() {
    pathBuffer.write('$varName.close();\n');
  }

  @override
  void cubicTo(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    pathBuffer.write('$varName.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);\n');
  }

  @override
  void lineTo(double x, double y) {
    pathBuffer.write('$varName.lineTo($x, $y);\n');
  }

  @override
  void moveTo(double x, double y) {
    pathBuffer.write('$varName.moveTo($x, $y);\n');
  }
}
