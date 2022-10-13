import 'package:crypto_app/data/responses/crypto_response.dart';
import 'package:crypto_app/data/responses/get_all_crypto_response.dart';
import 'package:crypto_app/domain/repositories/get_all_cryptos_repository.dart';
import 'package:crypto_app/domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase_imp.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/api_factory.dart';

class GetAllCryptosRepositoryMock extends Mock
    implements GetAllCryptosRepository {}

void main() {
  late GetAllCryptosRepositoryMock getAllCryptosRepositoryMock;
  late GetAllCryptosUsecaseImp getAllCryptosUsecaseImp;

  setUp(() {
    getAllCryptosRepositoryMock = GetAllCryptosRepositoryMock();
    getAllCryptosUsecaseImp =
        GetAllCryptosUsecaseImp(getAllCryptosRepositoryMock);
  });

  test(
      'WHEN getAllCryptos is requested by GetAllCryptoUsecase THEN getAllCryptos from GetAllCryptosRepository is called ',
      () async {
    String randomString = faker.lorem.random.string(15);

    when(
      (() => getAllCryptosRepositoryMock.getAllCryptos(randomString)),
    ).thenAnswer(
      (_) async => GetAllCryptosResponse(
        List<CryptoResponse>.from(
          ApiFactory.getAllCryptos().map(
            (e) => CryptoResponse.fromJson(
              e,
            ),
          ),
        ),
      ),
    );

    await getAllCryptosUsecaseImp.getAllCryptos(randomString);

    verify(
      () => getAllCryptosRepositoryMock.getAllCryptos(randomString),
    ).called(1);
  });
}
