library svg_to_path_annotation;
export 'package:flutter/cupertino.dart';
export 'package:flutter/rendering.dart';

class SvgSource {
  final String path;

  const SvgSource(this.path) : assert(path != null);
}