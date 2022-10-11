import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:crypto_app/domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'default_models.dart';

final fakeCryptosProvider =
    FutureProvider.autoDispose.family<WalletEntity, String>(
  (ref, arg) => AllCryptosFakeRepository().getAllCryptos('brl'),
);

final fakeCryptosErrorProvider =
    FutureProvider.autoDispose.family<WalletEntity, String>(
  (ref, arg) => Future.error('Error'),
);

class AllCryptosFakeRepository implements GetAllCryptosUsecase {
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
