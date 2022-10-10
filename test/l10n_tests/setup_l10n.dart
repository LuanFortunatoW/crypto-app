import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Setupl10n extends StatelessWidget {
  const Setupl10n({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocalizations.of(context)!.languageSymbol),
        Text(AppLocalizations.of(context)!.monetarySymbol),
        Text(AppLocalizations.of(context)!.monetaryAbbreviation),
        Text(AppLocalizations.of(context)!.portfolio),
        Text(AppLocalizations.of(context)!.transactions),
        Text(AppLocalizations.of(context)!.mainTitle),
        Text(AppLocalizations.of(context)!.portfolioTotalTitle),
        Text(AppLocalizations.of(context)!.details),
        Text(AppLocalizations.of(context)!.currentPrice),
        Text(AppLocalizations.of(context)!.lastDayVariation),
        Text(AppLocalizations.of(context)!.quantity),
        Text(AppLocalizations.of(context)!.value),
        Text(AppLocalizations.of(context)!.convertCurrency),
        Text(AppLocalizations.of(context)!.availableBalance),
        Text(AppLocalizations.of(context)!.estimatedTotal),
        Text(AppLocalizations.of(context)!.howMuchToConvert),
        Text(AppLocalizations.of(context)!.selectCurrency),
        Text(AppLocalizations.of(context)!.greaterThanBalance),
        Text(AppLocalizations.of(context)!.reviewConversionData),
        Text(AppLocalizations.of(context)!.convert),
        Text(AppLocalizations.of(context)!.receive),
        Text(AppLocalizations.of(context)!.exchange),
        Text(AppLocalizations.of(context)!.completeConversion),
        Text(AppLocalizations.of(context)!.conversionPerformed),
        Text(AppLocalizations.of(context)!.conversionPerformedLong),
        Text(AppLocalizations.of(context)!.loadingError),
        Text(AppLocalizations.of(context)!.tryAgain),
      ],
    );
  }
}
