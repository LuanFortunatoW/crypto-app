import '../../domain/entities/wallet_entity.dart';
import '../../domain/repositories/get_all_cryptos_repository.dart';
import '../datasource/get_all_cryptos_datasource.dart';

class GetAllCryptoRepositoryImp implements GetAllCryptosRepository {
  final GetAllCryptosDatasource _datasource;
  GetAllCryptoRepositoryImp(this._datasource);

  @override
  Future<WalletEntity> getAllCryptos() {
    return _datasource.getAllCryptos();
  }
}
