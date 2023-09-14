import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SpCase {
  String value;
  final double size;
  final Color color;

  SpCase({
    required this.value,
    required this.size,
    required this.color,
  });
}

Color aqua = HexColor('#00FFFF');
Color blo = const Color.fromARGB(255, 41, 98, 255);

SpCase oCase = SpCase(
  value: 'O',
  size: 100,
  color: aqua,
);
SpCase xCase = SpCase(
  value: 'X',
  size: 100,
  color: blo,
);
SpCase defCase = SpCase(
  value: '',
  size: 0,
  color: Colors.yellow,
);
