import 'package:crypto_app/src/presenter/view/shared/controllers/pages/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/bottom_navigation_bar_app.dart';

class PortfolioPage extends HookConsumerWidget {
  const PortfolioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(pageProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: page,
        bottomNavigationBar: const BottomNavigationBarApp(),
      ),
    );
  }
}
