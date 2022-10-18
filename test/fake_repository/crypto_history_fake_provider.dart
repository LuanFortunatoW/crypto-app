import 'package:crypto_app/domain/entities/crypto_history_entity.dart';
import 'package:crypto_app/domain/usecases/get_crypto_history/get_crypto_history_usecase.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoHistoryFakeProvider implements GetCryptoHistoryUsecase {
  CryptoHistoryFakeProvider();

  @override
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id) async {
    final List<CryptoHistoryEntity> response = [];
    for (var i = 0; i < 90; i++) {
      response.add(
        CryptoHistoryEntity(
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          price: Decimal.zero,
        ),
      );
    }
    return response;
  }
}

final fakeHistoryProvider =
    FutureProvider.autoDispose.family<List<CryptoHistoryEntity>, String>(
  (ref, arg) => CryptoHistoryFakeProvider().getCryptoHistory('id'),
);

final fakeHistoryErrorProvider =
    FutureProvider.autoDispose.family<List<CryptoHistoryEntity>, String>(
  (ref, arg) => Future.error('Error'),
);
