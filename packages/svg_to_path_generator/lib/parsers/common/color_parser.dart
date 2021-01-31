import 'package:svg_to_path_generator/helpers/colors.dart' as ColorHelper;

class ColorParser {
  String? _colorStr;

  ColorParser(this._colorStr);

  String? parse() {
    if (_colorStr == null) {
      return null;
    }
    if (ColorHelper.namedColors.containsKey(_colorStr)) {
      return ColorHelper.namedColors[_colorStr];
    }
    return 'Color(0xFF${_colorStr?.replaceAll('#', '')})';
  }
}
