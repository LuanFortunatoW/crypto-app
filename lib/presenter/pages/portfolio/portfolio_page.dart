import 'package:flutter/material.dart';

import '../../../shared/widgets/bottom_navigation_bar_app.dart';
import 'widgets/body_portifolio_page.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  static const route = '/portfolio';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BodyPortifolioPage(),
      bottomNavigationBar: BottomNavigationBarApp(),
    );
  }
}
