import 'package:flutter/material.dart';

import 'list_view_cryptos.dart';
import 'top_portfolio_page.dart';

class BodyPortifolioPage extends StatelessWidget {
  const BodyPortifolioPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            TopPortfolioPage(),
            ListViewCryptos(),
          ],
        ),
      ),
    );
  }
}
