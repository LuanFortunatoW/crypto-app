import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../shared/controllers/pages/page_provider.dart';

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
    final pagesController = ref.watch(pageProvider.notifier);

    return BottomNavigationBar(
      currentIndex: pagesController.index,
      onTap: (value) {
        pagesController.changePage(value);
        setState(() {});
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
          label: 'Portfólio',
          icon: ImageIcon(
            Image.asset('assets/icons/Union_Inative.png').image,
          ),
        ),
      ],
    );
  }
}
