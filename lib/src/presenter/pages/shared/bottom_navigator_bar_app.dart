import 'package:flutter/material.dart';

class BottomNavigatoBarApp extends StatelessWidget {
  const BottomNavigatoBarApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
