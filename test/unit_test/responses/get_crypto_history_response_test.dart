import 'package:crypto_app/data/responses/get_crypto_history_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'WHEN converting GetCryptoHistoryResponse to Json THEN return json',
    () async {
      GetCryptoHistoryResponse getCryptoHistoryResponse =
          GetCryptoHistoryResponse(
        prices: [],
      );

      expect(
        getCryptoHistoryResponse.toJson(),
        {
          'prices': [],
        },
      );
    },
  );
}
