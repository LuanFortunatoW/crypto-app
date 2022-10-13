import 'package:crypto_app/data/enpoint/get_all_cryptos_enpoint.dart';
import 'package:crypto_app/data/repository/get_all_cryptos_repository_imp.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/api_factory.dart';

class GetAllCryptosEndpointMock extends Mock implements GetAllCryptosEnpoint {}

void main() {
  late GetAllCryptosEndpointMock getAllCryptosEndpointMock;
  late GetAllCryptoRepositoryImp getAllCryptoRepository;

  setUp(() {
    getAllCryptosEndpointMock = GetAllCryptosEndpointMock();
    getAllCryptoRepository =
        GetAllCryptoRepositoryImp(getAllCryptosEndpointMock);
  });

  test(
      'WHEN getAllCryptos is requested by GetAllCryptoRepository THEN getAllCryptos from GetAllCryptosEndpoint is called ',
      () async {
    String randomString = faker.lorem.random.string(15);

    when(
      (() => getAllCryptosEndpointMock.getAllCryptos(randomString)),
    ).thenAnswer(
      (_) async => Response(
        data: ApiFactory.getAllCryptos(),
        requestOptions: RequestOptions(
          path: faker.internet.httpUrl(),
        ),
      ),
    );

    await getAllCryptoRepository.getAllCryptos(randomString);

    verify(
      () => getAllCryptosEndpointMock.getAllCryptos(randomString),
    ).called(1);
  });
}
