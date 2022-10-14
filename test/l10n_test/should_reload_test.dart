import 'package:crypto_app/l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN load AppLocalizations.shouldReload THEN return false',
    () async {
      expect(
          AppLocalizations.delegate.shouldReload
              .call(AppLocalizations.delegate),
          false);
    },
  );
}
