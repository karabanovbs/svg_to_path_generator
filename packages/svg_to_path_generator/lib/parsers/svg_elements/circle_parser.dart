import 'package:svg_to_path_generator/parsers/common/color_parser.dart';
import 'package:svg_to_path_generator/parsers/common/stroke_parser.dart';
import 'package:svg_to_path_generator/parsers/common/transform_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/svg_element_parser.dart';
import 'package:xml/xml.dart';

class CircleParser implements SvgElementParser {
  final XmlElement _element;
  final String _elementId;

  CircleParser(this._elementId, this._element);

  @override
  String paint() {
    var cx = _element.getAttribute('cx') ?? '0';
    var cy = _element.getAttribute('cy') ?? '0';
    var r = _element.getAttribute('r') ?? '0';

    var color = ColorParser(_element.getAttribute('fill'));
    var colorStr = color.parse();

    StringBuffer result = StringBuffer();

    result.writeln(
        'final Rect oval$_elementId = Rect.fromCircle(center: Offset($cx, $cy), radius: $r);');
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

    result.writeln('var path$_elementId = Path()..addOval(oval$_elementId);');

    var transform = TransformParser(_element.getAttribute('transform'));

    if(transform.isTransform) {
      result.writeln('path$_elementId = path$_elementId.transform(${transform.parse()});');
    }

    result.writeln('canvas.drawPath(path$_elementId, paint$_elementId);');
    return result.toString();
  }

  @override
  String get name => 'circle${_elementId}';

  @override
  String get id => _elementId;
}
