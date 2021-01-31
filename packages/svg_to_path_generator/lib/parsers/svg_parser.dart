import 'package:svg_to_path_generator/parsers/svg_elements/circle_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/group_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/path_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/svg_element_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/unknown_element_parser.dart';
import 'package:xml/xml.dart';

class SvgParser {
  final List<SvgElementParser> _elements = [];
  final String elementNamePrefix;

  Map<String, SvgElementParser Function(String id, XmlElement element)>
      _parsersMap = {
    'path': (id, element) => PathParser(id, element),
    'circle': (id, element) => CircleParser(id, element),
    'g': (id, element) => GroupParser(id, element),
    'unknown': (_, element) => UnknownElementParser(element),
  };

  SvgParser({
    this.elementNamePrefix = '',
  });

  addElement(XmlElement element) {
    _elements.add(_parsersMap[element.name.toString()]
            ?.call(_elements.length.toString() + elementNamePrefix, element) ??
        _parsersMap['unknown']!('', element));
  }

  String elementPaints() {
    return _elements
        .where((element) => !(element is UnknownElementParser))
        .map((e) => '''
         ${e.name}(Canvas canvas, Size size) {
            ${e.paint()}
         }
         ${e is SvgElementWithNestedParser ? e.nestedPaint() : ""}
        ''')
        .join('\n');
  }

  String paint() {
    return _elements.map((e) {
      if (e is UnknownElementParser) {
        return '// element with tag: ${e.name} not supported';
      }
      return '${e.name}(canvas, size);';
    }).join('\n');
  }
}
