import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/page_provider.dart';

class BottomNavigationBarApp extends HookConsumerWidget {
  const BottomNavigationBarApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagesController = ref.watch(pageProvider.state);

    return BottomNavigationBar(
      currentIndex: pagesController.state,
      onTap: (value) {
        switch (value) {
          case 0:
            Navigator.pushReplacementNamed(context, '/portfolio');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/transactions');
            break;
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
