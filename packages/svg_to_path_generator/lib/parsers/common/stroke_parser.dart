import 'package:svg_to_path_generator/parsers/common/color_parser.dart';

class StrokeParser {
  String? _strokeColor;
  String? _strokeWidth;
  String? _strokeCap;

  StrokeParser(
    this._strokeColor,
    this._strokeWidth,
    this._strokeCap,
  );

  get isStroke => strokeColor != null;

  String? get strokeWidth {
    if (_strokeWidth != null) {
      return _strokeWidth;
    }
    return null;
  }

  String? get strokeCap {
    if (_strokeCap != null) {
      switch (_strokeCap) {
        case 'butt':
          return 'StrokeCap.butt';
        case 'round':
          return 'StrokeCap.round';
        case 'square':
          return 'StrokeCap.square';
      }
    }
    return null;
  }

  get strokeColor => ColorParser(_strokeColor).parse();
}
