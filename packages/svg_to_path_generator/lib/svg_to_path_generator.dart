library svg_to_path_generator;

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_to_path_annotation/svg_to_path_annotation.dart';
import 'package:svg_to_path_generator/parsers/svg_parser.dart';
import 'package:xml/xml.dart';

class SvgToPathGenerator extends GeneratorForAnnotation<SvgSource> {
  @override
  generateForAnnotatedElement(
      element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) throw '$element is not a ClassElement';
    final classElement = element as ClassElement;

    final path = annotation.read('path').stringValue;
    final svgStr = new File(path).readAsStringSync();

    var svgParser = new SvgParser();

    final document = XmlDocument.parse(svgStr);

    var root = document.rootElement;
    if (root.name.toString() != 'svg') {
      throw 'not root svg';
    }

    var originalHeight = root.getAttribute('height');
    var originalWidth = root.getAttribute('width');

    root.nodes.whereType<XmlElement>().forEach((element) {
      svgParser.addElement(element);
    });

    return '''
    // SvgToPath for ${path}
    
    ${'// ' + svgStr.toString().replaceAll('\n', '\n // ')}
        
    class _${classElement.name}Painter extends CustomPainter {
    
      final originalHeight = $originalHeight;
      final originalWidth = $originalWidth;
          @override
      void paint(Canvas canvas, Size size) {
        canvas.scale(size.width / $originalWidth, size.height / $originalHeight);
      
        ${svgParser.paint()}
      }

      ${svgParser.elementPaints()}

      @override
      bool shouldRepaint(_${classElement.name}Painter oldDelegate) => false;
    }
    
    
          
    class _${classElement.name} extends StatelessWidget {
        final Widget child;
        final Color color;
      
        const _${classElement.name}({
          Key key,
          this.child, 
          this.color, 
        }) : super(key: key);
      
        @override
        Widget build(BuildContext context) {
          return AspectRatio(
              aspectRatio: $originalWidth / $originalHeight,
              child: CustomPaint(
                painter: _${classElement.name}Painter(
                ),
                child: child,
              ),
            );
        }
    }
     
    ''';
  }
}
