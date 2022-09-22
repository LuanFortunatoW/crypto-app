import 'package:crypto_app/domain/entities/wallet_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_all_cryptos_usecase/get_all_cryptos_usecase.dart';

class CryptosNotifier extends StateNotifier<WalletEntity> {
  final GetAllCryptosUsecase _usecase;

  CryptosNotifier(this._usecase) : super(WalletEntity(cryptos: [])) {
    getAllCryptos();
  }

  void getAllCryptos() async {
    state = await _usecase.getAllCryptos();
  }
}