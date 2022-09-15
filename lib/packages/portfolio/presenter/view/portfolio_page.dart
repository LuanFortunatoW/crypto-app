import 'package:crypto_app/packages/portfolio/presenter/view/widgets/body_portifolio_page.dart';
import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navigation_bar_app.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyPortifolioPage(),
        bottomNavigationBar: BottomNavigationBarApp(),
      ),
    );
  }
}
