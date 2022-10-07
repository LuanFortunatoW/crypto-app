import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:crypto_app/presenter/pages/transactions/widgets/list_view_transacitons.dart';
import 'package:flutter/material.dart';

class BodyTransactionsPage extends StatelessWidget {
  const BodyTransactionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          child: Text(
            AppLocalizations.of(context)!.transactions,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(
          indent: 16,
          height: 10,
          thickness: 1,
        ),
        const Expanded(
          child: ListViewTransacitons(),
        ),
      ],
    );
  }
}
