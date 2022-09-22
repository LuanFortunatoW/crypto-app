import 'package:crypto_app/data/datasource/mapper/crypto_histotry_mapper.dart';

import '../../../../domain/entities/crypto_history_entity.dart';
import '../../endpoints/get_crypto_history_endpoint.dart';
import '../../get_crypto_history_datasource.dart';
import '../../responses/get_crypto_history_response.dart';

class GetCryptoHistoryRemoteDatasourceImp
    implements GetCryptoHistoryDatasource {
  final GetCryptoHistoryEndpoint getCryptoHistoryEnpoint;

  GetCryptoHistoryRemoteDatasourceImp(this.getCryptoHistoryEnpoint);

  @override
  Future<List<CryptoHistoryEntity>> getCryptoHistory(String id) async {
    final response = await getCryptoHistoryEnpoint.getCryptoHistory(id);

    final GetCryptoHistoryResponse getCryptoHistoryResponse =
        GetCryptoHistoryResponse.fromJson(response.data);

    return getCryptoHistoryResponse.toViewData();
  }
}
