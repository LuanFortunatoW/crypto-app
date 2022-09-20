import 'dart:math';
import 'package:decimal/decimal.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../get_crypto_history_datasource.dart';

class GetCryptoHistoryDatasourceLocalImp implements GetCryptoHistoryDatasource {
  @override
  Map<DateTime, CryptoEntity> getCryptoHistory(CryptoEntity cryptoEntity) {
    Map<DateTime, CryptoEntity> history = {};
    for (var i = 0; i < 90; i++) {
      CryptoEntity newCrypto = CryptoEntity(
        initials: cryptoEntity.initials,
        image: cryptoEntity.image,
        name: cryptoEntity.name,
        price: cryptoEntity.price *
            Decimal.parse('${1 + Random().nextInt(10) / 100}'),
      );
      DateTime dateTime = DateTime.now().subtract(Duration(days: i));

      history.addEntries({dateTime: newCrypto}.entries);
    }
    return history;
  }
}
