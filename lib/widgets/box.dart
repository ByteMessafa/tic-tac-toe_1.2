import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Box extends StatefulWidget {
  Box(
      {super.key,
      required this.color,
      required this.size,
      required this.value});
  Color color;
  double size;
  String value;
  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 118,
      height: 118,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          widget.value,
          style: TextStyle(
            color: widget.color,
            fontSize: widget.size,
          ),
        ),
      ),
    );
  }
}
