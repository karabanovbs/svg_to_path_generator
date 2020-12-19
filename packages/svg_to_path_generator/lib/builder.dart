import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_to_path_generator/svg_to_path_generator.dart';

Builder svgToPathGen(BuilderOptions options) =>
    SharedPartBuilder([SvgToPathGenerator()], 'svg_to_path_generator');