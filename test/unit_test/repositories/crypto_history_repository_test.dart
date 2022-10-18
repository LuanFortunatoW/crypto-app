import 'package:crypto_app/data/enpoint/get_crypto_history_endpoint.dart';
import 'package:crypto_app/data/repository/get_crypto_history_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/api_factory.dart';

class CryptoHistoryEndpointMock extends Mock
    implements GetCryptoHistoryEndpoint {}

void main() {
  late CryptoHistoryEndpointMock cryptoHistoryEndpointMock;
  late GetCryptoHistoryRepositoryImp cryptoHistoryRepository;
  setUp(() {
    cryptoHistoryEndpointMock = CryptoHistoryEndpointMock();
    cryptoHistoryRepository =
        GetCryptoHistoryRepositoryImp(cryptoHistoryEndpointMock);
  });

  test(
      'WHEN getCryptoHistory is requested by GetCryptoHistoryRepositoryImp THEN getCryptoHistory from GetCryptoHistoryEndpoint is called ',
      () async {
    String randomString = faker.lorem.random.string(15);

    when(
      (() => cryptoHistoryEndpointMock.getCryptoHistory(randomString)),
    ).thenAnswer(
      (_) async => Response(
        data: ApiFactory.getCryptoHistory(),
        requestOptions: RequestOptions(
          path: faker.internet.httpUrl(),
        ),
      ),
    );

    await cryptoHistoryRepository.getCryptoHistory(randomString);

    verify(
      () => cryptoHistoryEndpointMock.getCryptoHistory(randomString),
    ).called(1);
  });
}
