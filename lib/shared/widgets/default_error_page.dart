import 'package:flutter/material.dart';

class DefaultErrorPage extends StatelessWidget {
  const DefaultErrorPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Erro ao Carregar',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(224, 43, 87, 1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: onPressed,
              color: const Color.fromRGBO(224, 43, 87, 1),
              child: const Text(
                'Tentar Novemente',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
