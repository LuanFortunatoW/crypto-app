import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navigation_bar_app.dart';
import 'widgets/body_transactions_page.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({Key? key}) : super(key: key);
  static const route = '/transactions';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BodyTransactionsPage(),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
