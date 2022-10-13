import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';
import 'animated_checkmark_widget.dart';

class ConversionConfirmationBody extends StatelessWidget {
  const ConversionConfirmationBody({
    Key? key,
  }) : super(
          // coverage:ignore-line
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AnimatedCheckmarkWidget(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              localization.conversionPerformed,
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            localization.conversionPerformedLong,
            style: const TextStyle(
              color: Color.fromRGBO(117, 118, 128, 1),
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
