import 'package:examples/svg_assets/sword.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SvgGeneratorExample(),
    );
  }
}

class SvgGeneratorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 250,
          width: 250,
          child: CustomPaint(
            painter: SwordSvg(),
          ),
        ),
      ),
    );
  }
}
