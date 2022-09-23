import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/crypto_entity.dart';
import '../../../domain/usecases/get_crypto_history/get_crypto_history_usecase.dart';

class CryptoHistoryNotifier extends StateNotifier<Map<DateTime, CryptoEntity>> {
  final GetCryptoHistoryUsecase _usecase;
  CryptoHistoryNotifier(this._usecase) : super({});

  void getCryptoHistory(CryptoEntity cryptoEntity) {
    state = _usecase.getCryptoHistory(cryptoEntity);
  }
}
