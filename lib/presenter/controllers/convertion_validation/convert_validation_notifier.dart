import 'package:crypto_app/domain/entities/wallet_crypto_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConvertValidationNotifier extends StateNotifier<bool> {
  ConvertValidationNotifier() : super(false);

  void validateconversion(
    double convertQuantity,
    WalletCryptoEntity convertedCurrency,
    WalletCryptoEntity toConvertCurrency,
  ) {
    final quantity = convertQuantity > convertedCurrency.quantity;
    final emptyId = convertQuantity >= convertedCurrency.quantity;
    final equalCrypto =
        toConvertCurrency.crypto.id == convertedCurrency.crypto.id;
    final zeroQuantity = convertQuantity <= 0;

    if (quantity || emptyId || equalCrypto || zeroQuantity) {
      state = false;
    } else {
      state = true;
    }
  }

  void setStatus(bool status) {
    state = status;
  }
}
