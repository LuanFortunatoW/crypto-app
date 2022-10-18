import 'package:crypto_app/data/responses/crypto_history_response.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN converting CryptoHistoryResponse to Json THEN return json',
    () async {
      CryptoHistoryResponse cryptoHistoryResponse = CryptoHistoryResponse(
        price: Decimal.zero,
        timeStamp: 10,
      );

      expect(
        cryptoHistoryResponse.toJson(),
        {
          'price': Decimal.zero,
          'timeStamp': 10,
        },
      );
    },
  );
}
