import 'dart:math';

import 'package:crypto_app/src/data/datasource/get_crypto_history_datasource.dart';
import 'package:crypto_app/src/domain/entities/crypto_entity.dart';
import 'package:decimal/decimal.dart';

class GetCryptoHistoryDatasourceLocalImp implements GetCryptoHistoryDatasource {
  @override
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity) {
    Map<DateTime, CryptoEntity> history = {};
    for (var i = 0; i < 90; i++) {
      CryptoEntity newCrypto = CryptoEntity(
        initials: cryptoEntity.initials,
        image: cryptoEntity.image,
        name: cryptoEntity.name,
        price: Decimal.parse(
            '${cryptoEntity.price.toDouble() * 1 + Random().nextInt(10) / 100}'),
      );
      DateTime dateTime = DateTime.now().subtract(Duration(days: i));

      history.addEntries({dateTime: newCrypto}.entries);
    }
    return history;
  }
}
