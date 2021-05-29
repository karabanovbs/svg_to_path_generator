## Getting Started

This package uses to generate Widget with Custom Painter inside from svg source.

# Installation

```yaml
dependencies:
  ...
  svg_to_path_annotation: <latest_version>

dev_dependencies:
 ...
  build_runner: <latest_version>
  svg_to_path_generator: <latest_version>
```

# examples

Annotate come class by `@SvgSource('<path-to-svg>')`:
```dart
import 'package:svg_to_path_annotation/svg_to_path_annotation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

part 'card.g.dart';

@SvgSource('assets/Card.svg')
class CardSvg extends _CardSvg {
}

```
Then run:
`flutter pub run build_runner build --delete-conflicting-outputs`

Use generated widget:
```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFF555555),
    body: Center(
      child: Container(
        height: 500,
        width: 500,
        child: CardSvg(),
      ),
    ),
  );
}
```