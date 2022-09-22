import 'package:crypto_app/domain/entities/crypto_history_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoHistoryNotifier extends StateNotifier<List<FlSpot>> {
  CryptoHistoryNotifier(List<CryptoHistoryEntity> historico) : super([]) {
    getCryptoHistory(historico);
  }

  void getCryptoHistory(List<CryptoHistoryEntity> historico) async {
    for (var element in historico) {
      state.add(
        FlSpot(
          double.parse(element.price.toString()),
          double.parse(element.timeStamp.toString()),
        ),
      );
    }
  }
}
