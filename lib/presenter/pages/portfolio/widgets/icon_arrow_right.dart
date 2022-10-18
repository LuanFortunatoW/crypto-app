import 'package:flutter/material.dart';

class IconArrowRight extends StatelessWidget {
  const IconArrowRight({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios_sharp,
      size: 14,
      color: Colors.grey.shade800,
    );
  }
}
