import 'dart:ui';

import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN lookupAppLocalizations executed with unsupported locale THEN throws FlutterError',
    () async {
      expect(
          () => lookupAppLocalizations(
                const Locale('lol'),
              ),
          throwsFlutterError);
    },
  );
}
