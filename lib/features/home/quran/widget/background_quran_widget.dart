import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.imageBg});

  final String imageBg;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          Image.asset(
            imageBg,
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),

          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          ),

        ],
      ),
    );
  }
}
