import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
  }) : super(// coverage:ignore-line
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(
              softWrap: true,
              AppLocalizations.of(context)!.howMuchToConvert,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color.fromRGBO(47, 47, 51, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
