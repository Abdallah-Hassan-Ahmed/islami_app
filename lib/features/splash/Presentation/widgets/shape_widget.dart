import 'package:flutter/material.dart';

class ShapeWidget extends StatelessWidget {
  const ShapeWidget({super.key, required this.images});

  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 187,
      width: 87,
      child: Image.asset(images),
    );
  }
}
