import 'package:crypto_app/presenter/portfolio/presenter/view/portfolio_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/page_provider.dart';

class BottomNavigationBarApp extends StatefulHookConsumerWidget {
  const BottomNavigationBarApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomNavigationBarApp> createState() =>
      _BottomNavigationBarAppState();
}

class _BottomNavigationBarAppState
    extends ConsumerState<BottomNavigationBarApp> {
  @override
  Widget build(BuildContext context) {
    final pagesController = ref.watch(pageProvider.state);

    return BottomNavigationBar(
      currentIndex: pagesController.state,
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const PortfolioPage(),
                transitionDuration: const Duration(microseconds: 0),
              ),
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const PortfolioPage(),
                transitionDuration: const Duration(microseconds: 0),
              ),
            );
            break;
          default:
        }
        pagesController.state = value;
      },
      selectedIconTheme: const IconThemeData(
        color: Color.fromRGBO(224, 43, 87, 1),
      ),
      backgroundColor: Colors.white,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          activeIcon: ImageIcon(
            Image.asset('assets/icons/Subtract.png').image,
          ),
          label: 'Portfólio',
          icon: ImageIcon(
            Image.asset('assets/icons/Subtract_Inative.png').image,
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: ImageIcon(
            Image.asset('assets/icons/Union.png').image,
          ),
          label: 'Movimentações',
          icon: ImageIcon(
            Image.asset('assets/icons/Union_Inative.png').image,
          ),
        ),
      ],
    );
  }
}
