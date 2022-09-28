import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConvertValidationNotifier extends StateNotifier<bool> {
  ConvertValidationNotifier() : super(false);

  void validateConvertion(
    double convertQuantity,
    WalletCryptoEntity convertedCurrency,
    WalletCryptoEntity toConvertCurrency,
  ) {
    if (convertQuantity >= convertedCurrency.quantity) {
      state = false;
    } else if (toConvertCurrency.crypto.id == '') {
      state = false;
    } else if (toConvertCurrency.crypto.id == convertedCurrency.crypto.id) {
      state = false;
    } else if (convertQuantity <= 0) {
      state = false;
    } else {
      state = true;
    }
  }

  void setFalse() {
    state = false;
  }
}
