import 'package:flutter/material.dart';

class RowInfoConversion extends StatelessWidget {
  const RowInfoConversion({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 19,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(47, 47, 51, 1),
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
