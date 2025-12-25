import 'package:flutter/material.dart';

const Color _customaColor = Color(0xFF05058E);

const List<Color> _colorThemes = [
  _customaColor,
  Colors.black,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}) : assert(selectedColor >= 0, ' Color index must be greater than 0'), assert(selectedColor < _colorThemes.length, ' Color index must be less than ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: Brightness.dark
    );
  }
}
