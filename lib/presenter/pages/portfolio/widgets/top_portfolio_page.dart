import '../../../../l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../shared/widgets/button_change_visibility.dart';
import 'total_wallet_value.dart';

class TopPortfolioPage extends StatelessWidget {
  const TopPortfolioPage({
    Key? key,
  }) : super(key: key); // coverage:ignore-line

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  localization.mainTitle,
                  style: const TextStyle(
                    color: Color.fromRGBO(224, 43, 87, 1),
                    fontSize: 32,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const ButtonChangeVisibility(),
              ],
            ),
          ),
          const TotalWalletValue(),
          Text(
            localization.portfolioTotalTitle,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
