import 'package:crypto_app/domain/entities/crypto_history_entity.dart';
import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:crypto_app/domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase.dart';
import 'package:crypto_app/domain/usecases/get_crypto_history/get_crypto_history_usecase.dart';
import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../default_models.dart';

class CryptoHistoryFakeRepository implements GetCryptoHistoryUsecase {
  CryptoHistoryFakeRepository();

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

class FakeAllCryptosRepository implements GetAllCryptosUsecase {
  @override
  Future<WalletEntity> getAllCryptos(String vsCurrency) async {
    return WalletEntity(
      cryptos: [
        DefaultModels.walletModelBTC,
        DefaultModels.walletModelETH,
      ],
    );
  }
}

final fakeHistoryProvider =
    FutureProvider.autoDispose.family<List<CryptoHistoryEntity>, String>(
  (ref, arg) => CryptoHistoryFakeRepository().getCryptoHistory('id'),
);

final fakeCryptosProvider =
    FutureProvider.autoDispose.family<WalletEntity, String>(
  (ref, arg) => FakeAllCryptosRepository().getAllCryptos('brl'),
);
