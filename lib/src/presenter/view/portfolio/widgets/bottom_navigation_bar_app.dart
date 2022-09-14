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
      backgroundColor: Colors.white,
      selectedItemColor: const Color.fromRGBO(224, 43, 87, 1),
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            Image.asset('assets/images/Subtract.png').image,
          ),
          label: 'Portfólio',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            Image.asset('assets/images/Union.png').image,
          ),
          label: 'Portfólio',
        ),
      ],
    );
  }
}
