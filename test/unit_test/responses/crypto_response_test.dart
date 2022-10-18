import 'package:crypto_app/data/responses/crypto_response.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN converting CryptoResponse to Json THEN return json',
    () async {
      CryptoResponse cryptoResponse = CryptoResponse(
        'bitcoin',
        'btc',
        'Bitcoin',
        'https',
        Decimal.zero,
      );

      expect(
        cryptoResponse.toJson(),
        {
          'id': 'bitcoin',
          'symbol': 'btc',
          'name': 'Bitcoin',
          'image': 'https',
          'currentPrice': Decimal.zero,
        },
      );
    },
  );
}
