import '../entities/wallet_entity.dart';

abstract class GetAllCryptosRepository {
  Future<WalletEntity> getAllCryptos();
}
