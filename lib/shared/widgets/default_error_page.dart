import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class DefaultErrorPage extends StatelessWidget {
  const DefaultErrorPage({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.loadingError,
            style: const TextStyle(
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
            child: Text(
              AppLocalizations.of(context)!.tryAgain,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
