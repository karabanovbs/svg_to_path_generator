import 'package:svg_to_path_generator/parsers/svg_elements/svg_element_parser.dart';
import 'package:xml/xml.dart';

class UnknownElementParser implements SvgElementParser {
  final XmlElement _element;

  UnknownElementParser(this._element);

  @override
  String paint() {
    return '// element with tag: ${_element.name} not supported';
  }

  @override
  String get name => _element.name.toString();

  @override
  String get id => '';
}
