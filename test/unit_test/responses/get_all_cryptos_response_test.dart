import 'package:crypto_app/data/responses/get_all_crypto_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Testing GetAllCryptosResponse conversions',
    () {
      test(
        'WHEN converting GetAllCryptosResponse to Json THEN return json',
        () async {
          GetAllCryptosResponse getAllCryptosResponse = GetAllCryptosResponse(
            [],
          );

          expect(
            getAllCryptosResponse.toJson(),
            {
              'results': [],
            },
          );
        },
      );
      test(
        'WHEN converting GetAllCryptosResponse from Json THEN return GetAllCryptosResponse',
        () async {
          Map<String, dynamic> response = {
            'results': [],
          };

          expect(
            GetAllCryptosResponse.fromJson(response).results,
            [],
          );
        },
      );
    },
  );
}
