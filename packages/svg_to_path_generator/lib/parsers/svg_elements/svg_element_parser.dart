abstract class SvgElementParser {
  String get name;
  String get id;

  String paint();
}

abstract class SvgElementWithNestedParser extends SvgElementParser {
  String nestedPaint();
}
