import 'package:svg_to_path_annotation/svg_to_path_annotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

part 'go.g.dart';

@SvgSource('assets/GO.svg')
class GoSvg extends _GoSvg {

  GoSvg():super(color: Color(0xFF123123));
}
