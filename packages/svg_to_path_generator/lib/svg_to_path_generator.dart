library svg_to_path_generator;

import 'dart:io';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:path_parsing/path_parsing.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_to_path_annotation/svg_to_path_annotation.dart';
import 'package:xml/xml.dart';

class SvgToPathGenerator extends GeneratorForAnnotation<SvgSource> {
  @override
  generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    if (element is! ClassElement) throw '$element is not a ClassElement';
    final classElement = element as ClassElement;

    final path = annotation.read('path').stringValue;
    final svgStr = new File(path).readAsStringSync();

    var generatedCode = new StringBuffer();

    final document = XmlDocument.parse(svgStr);

    var root = document.rootElement;
    if (root.name.toString() != 'svg') {
      throw 'not root svg';
    }

    var originalHeight = root.getAttribute('height');
    var originalWidth = root.getAttribute('width');

    root.descendants.whereType<XmlElement>().forEach((element) {
      _parseElement(generatedCode, element);
    });

    return '''
    // SvgToPath for ${path}
    
    ${'// ' + svgStr.toString().replaceAll('\n', '\n // ')}
    
    class _${classElement.name} extends CustomPainter {
      @override
      void paint(Canvas canvas, Size size) {
        canvas.scale(size.width / $originalWidth, size.height / $originalHeight);
      
        ${generatedCode.toString()}
      }

      @override
      bool shouldRepaint(_${classElement.name} oldDelegate) => false;
    }
     
    ''';
  }

  Map<String, String Function(XmlElement element, String id)> _generators =
      <String, String Function(XmlElement element, String id)>{
    'path': (XmlElement element, String id) {
      StringPathProxy pathProxy = StringPathProxy('path$id');
      writeSvgPathDataToPath(element.getAttribute('d'), pathProxy);

      var colorStr = '0xFF${element.getAttribute('fill')?.replaceAll('#', '')}';

      String fillType;
      switch (element.getAttribute('fill-rule')) {
        case 'evenodd':
          fillType = 'PathFillType.evenOdd';
          break;
        case 'nonzero':
          fillType = 'PathFillType.nonZero';
          break;
        default:
          fillType = 'null';
      }

      return '''Paint paint$id = Paint();
      paint$id.color = Color($colorStr).withOpacity(1);
      var path$id = Path();
      path$id.fillType = $fillType;
      
      ${pathProxy.pathBuffer.toString()}
      
      canvas.drawPath(path$id, paint$id);\n
      ''';
    },
    'circle': (XmlElement element, String id) {
      var cx = element.getAttribute('cx') ?? '0';
      var cy = element.getAttribute('cy') ?? '0';
      var r = element.getAttribute('r') ?? '0';

      var colorStr = '0xFF${element.getAttribute('fill')?.replaceAll('#', '')}';

      return '''final Rect oval$id = Rect.fromCircle(center: Offset($cx, $cy), radius: $r);
      Paint paint$id = Paint();
      // paint$id.color = Color($colorStr).withOpacity(1);
      var path$id = Path()..addOval(oval$id);
            
      canvas.drawPath(path$id, paint$id);\n
      ''';
    },
  };

  void _parseElement(StringBuffer generatedCode, XmlElement element) {
    var elementGeneratedFun = _generators[element.name.toString()];

    var elementGeneratedCode =
        elementGeneratedFun?.call(element, generatedCode.length.toString());

    if (elementGeneratedCode != null) {
      generatedCode.write(elementGeneratedCode);
    } else {
      generatedCode
          .write('// element with tag: ${element.name} not supported\n');
    }
  }
}

class StringPathProxy extends PathProxy {
  final String varName;


  StringPathProxy(this.varName,
      {StringBuffer? pathBuffer})
      : pathBuffer = pathBuffer ?? StringBuffer();

  final StringBuffer pathBuffer;

  @override
  void close() {
    pathBuffer.write('$varName.close();\n');
  }

  @override
  void cubicTo(
      double x1, double y1, double x2, double y2, double x3, double y3) {
    pathBuffer.write(
        '$varName.cubicTo($x1, $y1, $x2, $y2, $x3, $y3);\n');
  }

  @override
  void lineTo(double x, double y) {
    pathBuffer
        .write('$varName.lineTo($x, $y);\n');
  }

  @override
  void moveTo(double x, double y) {
    pathBuffer
        .write('$varName.moveTo($x, $y);\n');
  }
}
