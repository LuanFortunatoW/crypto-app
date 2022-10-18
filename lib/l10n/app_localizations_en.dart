import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get languageSymbol => 'en_US';

  @override
  String get monetaryAbbreviation => 'usd';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get transactions => 'Transactions';

  @override
  String get mainTitle => 'Crypto';

  @override
  String get portfolioTotalTitle => 'Total currency value';

  @override
  String get details => 'Details';

  @override
  String get currentPrice => 'Current Price';

  @override
  String get lastDayVariation => '24h Variation';

  @override
  String get quantity => 'Quantity';

  @override
  String get value => 'Value';

  @override
  String get convertCurrency => 'Convert Currency';

  @override
  String get availableBalance => 'Available Balance';

  @override
  String get estimatedTotal => 'Estimated total';

  @override
  String get howMuchToConvert => 'How much would you like to convert?';

  @override
  String get selectCurrency => 'Select a currency to convert';

  @override
  String get greaterThanBalance => 'Value greater than the available balance';

  @override
  String get reviewConversionData => 'Review your conversion data';

  @override
  String get convert => 'Convert';

  @override
  String get receive => 'Receive';

  @override
  String get exchange => 'Exchange';

  @override
  String get completeConversion => 'Complete Conversion';

  @override
  String get conversionPerformed => 'Conversion performed';

  @override
  String get conversionPerformedLong => 'Currency conversion performed successfully!';

  @override
  String get loadingError => 'Loading Error';

  @override
  String get tryAgain => 'Try Again';
}
