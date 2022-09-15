import 'package:flutter/material.dart';

import 'widgets/body_transactions_page.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const BodyTransactionsPage(),
    );
  }
}
