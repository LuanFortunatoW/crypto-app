import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// represents the default currency used on a language
  ///
  /// In en, this message translates to:
  /// **'\$'**
  String get monetarySymbol;

  /// represents the default currency used on a language abbreviated
  ///
  /// In en, this message translates to:
  /// **'usd'**
  String get monetaryAbbreviation;

  /// Name of th page containing all cryptos
  ///
  /// In en, this message translates to:
  /// **'Portfolio'**
  String get portfolio;

  /// Name of the page containing all transactions
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get transactions;

  /// Main title on front page
  ///
  /// In en, this message translates to:
  /// **'Crypto'**
  String get mainTitle;

  /// Label to describe the total value on portfolio page
  ///
  /// In en, this message translates to:
  /// **'Total currency value'**
  String get portfolioTotalTitle;

  /// Give more information
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// Describe the price at the moment
  ///
  /// In en, this message translates to:
  /// **'Current Price'**
  String get currentPrice;

  /// Represents the change in the last 24 hours cycle
  ///
  /// In en, this message translates to:
  /// **'24h Variation'**
  String get lastDayVariation;

  /// Describe the amount of something
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// Represents how much something costs
  ///
  /// In en, this message translates to:
  /// **'Value'**
  String get value;

  /// The act of change monetary values to another currency
  ///
  /// In en, this message translates to:
  /// **'Convert Currency'**
  String get convertCurrency;

  /// The amount of crypto the user have
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// Aproximate value after converting
  ///
  /// In en, this message translates to:
  /// **'Estimated total'**
  String get estimatedTotal;

  /// Label to instruct the user to type how many cryptos it will like to convert
  ///
  /// In en, this message translates to:
  /// **'How much would you like to convert?'**
  String get howMuchToConvert;

  /// Describe the currency that the user chose
  ///
  /// In en, this message translates to:
  /// **'Select a currency to convert'**
  String get selectCurrency;

  /// Message to warn the user that the amount exceeds what it has
  ///
  /// In en, this message translates to:
  /// **'Value greater than the available balance'**
  String get greaterThanBalance;

  /// Label to describe all the infomations about a conversion the user is about to make
  ///
  /// In en, this message translates to:
  /// **'Review your conversion data'**
  String get reviewConversionData;

  /// Word to describe the exchange of a crypto for another
  ///
  /// In en, this message translates to:
  /// **'Convert'**
  String get convert;

  /// The amount the user is goin to receive on conversion
  ///
  /// In en, this message translates to:
  /// **'Receive'**
  String get receive;

  /// Word to describe how much the trade costs
  ///
  /// In en, this message translates to:
  /// **'Exchange'**
  String get exchange;

  /// Describe the act of finishig a conversion
  ///
  /// In en, this message translates to:
  /// **'Complete Conversion'**
  String get completeConversion;

  /// Short title to describe thar the conversion was finished
  ///
  /// In en, this message translates to:
  /// **'Conversion performed'**
  String get conversionPerformed;

  /// Small phrase to describe that the conversion was completed
  ///
  /// In en, this message translates to:
  /// **'Currency conversion performed successfully!'**
  String get conversionPerformedLong;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
