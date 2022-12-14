import 'package:flutter/material.dart';

import '../../presenter/pages/conversion_confirmation/conversion_confirmation_page.dart';
import '../../presenter/pages/conversion_review/conversion_review_args.dart';
import '../../presenter/pages/conversion_review/conversion_review_page.dart';
import '../../presenter/pages/convert_%20currency/convert_currency_args.dart';
import '../../presenter/pages/convert_%20currency/convert_currency_page.dart';
import '../../presenter/pages/crypto_info/crypto_info_args.dart';
import '../../presenter/pages/crypto_info/crypto_info_page.dart';
import '../../presenter/pages/portfolio/portfolio_page.dart';
import '../../presenter/pages/transactions/transactions_page.dart';

class GeneratedRoutes {
  static Route<dynamic>? generateRoute(settings) {
    if (settings.name == PortfolioPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PortfolioPage(),
        settings: settings,
      );
    } else if (settings.name == TransactionsPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TransactionsPage(),
        settings: settings,
        transitionDuration: const Duration(microseconds: 0),
      );
    } else if (settings.name == CryptoInfoPage.route) {
      final args = settings.arguments as CryptoInfoArgs;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CryptoInfoPage(args: args),
        settings: settings,
      );
    } else if (settings.name == ConvertCurrencyPage.route) {
      final args = settings.arguments as ConvertCurrencyArgs;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ConvertCurrencyPage(args: args),
        settings: settings,
      );
    } else if (settings.name == ConversionReviewPage.route) {
      final args = settings.arguments as ConversionReviewArgs;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ConversionReviewPage(args: args),
        settings: settings,
      );
    } else if (settings.name == ConversionConfirmationPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ConversionConfirmationPage(),
        settings: settings,
      );
    }
    return null;
  }
}
