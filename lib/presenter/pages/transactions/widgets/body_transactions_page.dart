import 'package:flutter/material.dart';

class BodyTransactionsPage extends StatelessWidget {
  const BodyTransactionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          child: Text(
            'Movimentações',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          indent: 16,
          height: 10,
          thickness: 1,
        ),
      ],
    );
  }
}
