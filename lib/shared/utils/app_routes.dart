import 'package:crypto_app/presenter/pages/crypto_info/details_args.dart';
import 'package:crypto_app/presenter/pages/crypto_info/crypto_info_page.dart';
import 'package:flutter/material.dart';

import '../../presenter/pages/portfolio/portfolio_page.dart';
import '../../presenter/pages/transactions/transactions_page.dart';

class GeneratedRoutes {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == '/portfolio') {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PortfolioPage(),
        settings: settings,
      );
    } else if (settings.name == '/transactions') {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TransactionsPage(),
        settings: settings,
        transitionDuration: const Duration(microseconds: 0),
      );
    } else if (settings.name == '/crypto_info') {
      final args = settings.arguments as CryptoInfoArgs;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CryptoInfoPage(args: args),
        settings: settings,
      );
    }
    return null;
  }
}
