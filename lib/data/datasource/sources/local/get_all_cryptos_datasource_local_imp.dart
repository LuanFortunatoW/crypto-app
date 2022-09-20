import 'package:decimal/decimal.dart';

import '../../../../domain/entities/crypto_entity.dart';
import '../../../../domain/entities/wallet_crypto_entity.dart';
import '../../../../domain/entities/wallet_entity.dart';
import '../../get_all_cryptos_datasource.dart';

class GetAllCryptosLocalDatasourceImp implements GetAllCryptosDatasource {
  @override
  WalletEntity getAllCryptos() {
    List<WalletCryptoEntity> cryptos = [];
    cryptos.add(
      WalletCryptoEntity(
        crypto: CryptoEntity(
          image: 'assets/images/BTC.png',
          initials: 'BTC',
          name: 'Bitcoin',
          price: Decimal.parse('109579.37'),
        ),
        quantity: 0.75,
      ),
    );
    cryptos.add(
      WalletCryptoEntity(
        crypto: CryptoEntity(
            image: 'assets/images/ETH.png',
            initials: 'ETH',
            name: 'Ethereum',
            price: Decimal.parse('8841.79')),
        quantity: 0.94,
      ),
    );
    cryptos.add(
      WalletCryptoEntity(
        crypto: CryptoEntity(
            image: 'assets/images/LTC.png',
            initials: 'LTC',
            name: 'Litecoin',
            price: Decimal.parse('314.00')),
        quantity: 0.82,
      ),
    );
    return WalletEntity(cryptos: cryptos);
  }
}
