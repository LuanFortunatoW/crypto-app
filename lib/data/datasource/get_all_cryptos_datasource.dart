import '../../domain/entities/wallet_entity.dart';

abstract class GetAllCryptosDatasource {
  Future<WalletEntity> getAllCryptos();
}
