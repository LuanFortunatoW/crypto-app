import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:flutter/material.dart';

import '../../presenter/pages/portfolio/portfolio_page.dart';
import '../../presenter/pages/transactions/transactions_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/portfolio': (context) => const PortfolioPage(),
  '/transactions': (context) => const TransactionsPage(),
  '/crypto_info': (context) => const CryptoInfoPage(),
};
