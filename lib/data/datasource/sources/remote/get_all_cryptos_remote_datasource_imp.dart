import 'package:crypto_app/data/datasource/endpoints/get_all_crypto_endpoint.dart';
import 'package:crypto_app/data/datasource/get_all_cryptos_datasource.dart';
import 'package:crypto_app/data/datasource/mapper/crypto_entity_mapper.dart';

import '../../../../domain/entities/wallet_entity.dart';
import '../../responses/crypto_response.dart';
import '../../responses/get_all_crypto_response.dart';

class GetAllCryptosRemoteDatasourceImp implements GetAllCryptosDatasource {
  final GetAllCryptosEndpoint _endpoint;

  GetAllCryptosRemoteDatasourceImp(this._endpoint);

  @override
  Future<WalletEntity> getAllCryptos() async {
    final response = await _endpoint.getAllCryptos();
    final GetAllCryptosResponse getAllcryptosResponse = GetAllCryptosResponse(
        List.from(response.data)
            .map((e) => CryptoResponse.fromJson(e))
            .toList());

    return getAllcryptosResponse.toViewData();
  }
}
