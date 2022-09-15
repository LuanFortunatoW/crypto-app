import 'package:flutter/material.dart';

import 'widgets/body_portifolio_page.dart';
import '../shared/bottom_navigator_bar_app.dart';

class PortifolioPage extends StatelessWidget {
  const PortifolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BodyPortifolioPage(),
        bottomNavigationBar: BottomNavigatoBarApp(),
      ),
    );
  }
}
