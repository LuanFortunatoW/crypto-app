import 'package:flutter/material.dart';

class DividerCryptoInfo extends StatelessWidget {
  const DividerCryptoInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color.fromRGBO(227, 228, 235, 1),
      indent: 16,
      height: 40,
      thickness: 1,
    );
  }
}
