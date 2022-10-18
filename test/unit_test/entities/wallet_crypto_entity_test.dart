import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake_repository/default_models.dart';

void main() {
  test(
    'WHEN getValidBalance on WalletCryptoEntity THEN return correct value',
    () {
      WalletCryptoEntity walletCryptoEntity = DefaultModels.walletModelBTC;

      expect(walletCryptoEntity.getValidBalance(Decimal.one), true);
      expect(walletCryptoEntity.getValidBalance(Decimal.parse('11')), false);
    },
  );
}
