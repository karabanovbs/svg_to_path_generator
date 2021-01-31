import 'package:svg_to_path_generator/parsers/svg_elements/circle_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/path_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/svg_element_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_elements/unknown_element_parser.dart';
import 'package:svg_to_path_generator/parsers/svg_parser.dart';
import 'package:xml/xml.dart';

class GroupParser implements SvgElementWithNestedParser {
  final String _elementId;
  final XmlElement _element;
  final SvgParser svgParser;

  GroupParser(this._elementId, this._element)
      : svgParser = SvgParser(elementNamePrefix: 'group$_elementId') {
    _element.nodes.whereType<XmlElement>().forEach((element) {
      svgParser.addElement(element);
    });
  }

  @override
  String get id => _elementId;

  @override
  String get name => 'group$_elementId';

  @override
  String paint() {
    return svgParser.paint();
  }

  @override
  String nestedPaint() {
    return svgParser.elementPaints();
  }

}
