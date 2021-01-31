import 'package:examples/svg_assets/card.dart';
import 'package:examples/svg_assets/go.dart';
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
      backgroundColor: Color(0xFF555555),
      body: Center(
        child: Container(
          height: 500,
          width: 500,
          child: GoSvg(
          ),
        ),
      ),
    );
  }
}
