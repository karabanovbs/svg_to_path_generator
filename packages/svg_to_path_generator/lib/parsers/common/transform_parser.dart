const String _transformCommandAtom = ' *,?([^(]+)\\(([^)]*)\\)';
final RegExp _transformValidator = RegExp('^($_transformCommandAtom)*\$');
final RegExp _transformCommand = RegExp(_transformCommandAtom);
final RegExp _valueSeparator = RegExp('( *, *| +)');

typedef _MatrixParser = String Function(String? paramsStr);

const Map<String, _MatrixParser> _matrixParsers = <String, _MatrixParser>{
  'matrix': _parseSvgMatrix,
  // 'translate': _parseSvgTranslate,
  // 'scale': _parseSvgScale,
  // 'rotate': _parseSvgRotate,
  // 'skewX': _parseSvgSkewX,
  // 'skewY': _parseSvgSkewY,
};

class TransformParser {
  final String? _transform;

  TransformParser(this._transform);

  bool get isTransform => _transform != null && _transform!.isNotEmpty;

  String? parse() {
    if (!isTransform) {
      return null;
    }

    if (!_transformValidator.hasMatch(_transform!))
      return '/// illegal or unsupported transform: $_transform';
    final Iterable<Match> matches =
        _transformCommand.allMatches(_transform!).toList().reversed;
    StringBuffer result = StringBuffer();
    result.writeln('Matrix4.identity()');
    for (Match m in matches) {
      final String command = m.group(1)!.trim();
      final String? params = m.group(2);

      final _MatrixParser? transformer = _matrixParsers[command];
      if (transformer == null) {
        result.writeln('/// command not supported');
      }

      result.writeln('${transformer!(params)}');
    }
    result.write('.storage');
    return result.toString();
  }
}

String _parseSvgMatrix(String? paramsStr) {
  final List<String> params = paramsStr!.trim().split(_valueSeparator);
  assert(params.isNotEmpty);
  assert(params.length == 6);
  final String a = params[0];
  final String b = params[1];
  final String c = params[2];
  final String d = params[3];
  final String e = params[4];
  final String f = params[5];

  return '.multiplied(Matrix4($a, $b, 0.0, 0.0, $c, $d, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, $e, $f, 0.0, 1.0))';
}
