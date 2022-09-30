import '../../../domain/entities/crypto_history_entity.dart';

import '../get_crypto_history_response.dart';

extension CryptoHistoryMapper on GetCryptoHistoryResponse {
  List<CryptoHistoryEntity> toViewData() {
    return List.from(
      prices.map(
        (cryptoHistory) => CryptoHistoryEntity(
            price: cryptoHistory.price, timeStamp: cryptoHistory.timeStamp),
      ),
    );
  }
}
