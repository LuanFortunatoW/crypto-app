import 'package:crypto_app/presenter/pages/portfolio/portfolio_page.dart';
import 'package:flutter/material.dart';

import 'widgets/conversion_confirmation_body.dart';

class ConversionConfirmationPage extends StatelessWidget {
  const ConversionConfirmationPage({Key? key}) : super(key: key);

  static const route = '/conversion_confirmation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(
                context, (route) => route.settings.name == PortfolioPage.route);
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
      ),
      body: const ConversionConfirmationBody(),
    );
  }
}
