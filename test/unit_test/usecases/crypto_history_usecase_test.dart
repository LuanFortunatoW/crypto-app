import 'package:crypto_app/data/responses/get_crypto_history_response.dart';
import 'package:crypto_app/domain/repositories/get_crypto_history_repository.dart';
import 'package:crypto_app/domain/usecases/get_crypto_history/get_crypto_history_usecase_imp.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../shared/api_factory.dart';

class CryptoHistoryRepositoryMock extends Mock
    implements GetCryptoHistoryRepository {}

void main() {
  late CryptoHistoryRepositoryMock cryptoHistoryRepositoryMock;
  late GetCryptoHistoryUsecaseImp getCryptoHistoryUsecaseImp;

  setUp(() {
    cryptoHistoryRepositoryMock = CryptoHistoryRepositoryMock();
    getCryptoHistoryUsecaseImp =
        GetCryptoHistoryUsecaseImp(cryptoHistoryRepositoryMock);
  });

  test(
      'WHEN getCryptoHistory is requested by GetCryptoHistoryUsecase THEN getCryptoHistory from GetCryptoHistoryRepository is called ',
      () async {
    String randomString = faker.lorem.random.string(15);

    when(
      (() => cryptoHistoryRepositoryMock.getCryptoHistory(randomString)),
    ).thenAnswer(
      (_) async => GetCryptoHistoryResponse.fromJson(
        ApiFactory.getCryptoHistory(),
      ),
    );

    await getCryptoHistoryUsecaseImp.getCryptoHistory(randomString);

    verify(
      () => cryptoHistoryRepositoryMock.getCryptoHistory(randomString),
    ).called(1);
  });
}
