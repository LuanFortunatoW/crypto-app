import '../../presenter/portfolio/view/portfolio_page.dart';
import '../../presenter/transactions/view/transactions_page.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/portfolio': (context) => const PortfolioPage(),
  '/transactions': (context) => const TransactionsPage(),
};
