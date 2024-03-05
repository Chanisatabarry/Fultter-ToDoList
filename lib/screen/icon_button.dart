import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const MyIconButton({
    Key? key,
    required this.imagePath,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Image.asset(
          imagePath,
          width: width,
          height: height,
        ),
        onPressed: () {},
      ),
    );
  }
}
