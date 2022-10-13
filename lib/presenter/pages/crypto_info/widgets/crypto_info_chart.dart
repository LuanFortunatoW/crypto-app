import '../../../../domain/entities/crypto_history_entity.dart';
import '../../../controllers/chart_days_amount/chart_days_amount_provider.dart';
import '../../../controllers/chart_subtitles/variation_in_chart_provider.dart';
import '../../../controllers/chart_subtitles/price_in_chart_provider.dart';
import '../../../controllers/crypto_history/crypto_history_provider.dart';
import '../details_args.dart';
import 'title_crypto_price.dart';
import '../../../../shared/widgets/default_error_page.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import 'buttons_change_days_chart.dart';

class CryptoInfoChart extends HookConsumerWidget {
  CryptoInfoChart({Key? key, required this.args}) : super(key: key);

  final CryptoInfoArgs args;
  final List<FlSpot> spots = [];

  void getSpots(List<CryptoHistoryEntity> cryptoHistory) {
    for (var history in cryptoHistory.reversed) {
      spots.add(
        FlSpot(
          double.parse(
            history.timeStamp.toString(),
          ),
          double.parse(
            history.price.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final history =
        ref.watch(cryptoHistoryProvider(args.walletCryptoEntity.crypto.id));
    final price = ref.watch(priceInChartProvider.state);
    final variation = ref.watch(variationInChartProvider.state);

    final List<int> days = [5, 15, 30, 45, 90];
    final selectedIndex = ref.watch(daysAmountProvider.state);

    return history.when(
      data: (data) {
        if (spots.isEmpty) {
          getSpots(data);
        }
        return AspectRatio(
          aspectRatio: 1.15,
          child: LineChart(
            LineChartData(
              borderData: FlBorderData(
                border: const Border(
                  bottom: BorderSide(
                    color: Color.fromRGBO(227, 228, 235, 1),
                    width: 2,
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                touchCallback: (event, response) {
                  if (response != null && response.lineBarSpots != null) {
                    int spotIndex = response.lineBarSpots![0].spotIndex;
                    if (spotIndex > 0 && spotIndex < spots.length - 1) {
                      variation.state = double.parse(
                        ((spots[spotIndex].y - spots[spotIndex + 1].y) /
                                spots[spotIndex - 1].y)
                            .toString(),
                      );
                    } else {
                      variation.state =
                          (spots.first.y - spots[1].y) / spots[1].y;
                    }
                    price.state = Decimal.parse(
                      response.lineBarSpots![0].y.toString(),
                    );
                  }

                  if (!event.isInterestedForInteractions) {
                    price.state = Decimal.parse(spots.first.y.toString());
                    variation.state = (spots.first.y - spots[1].y) / spots[1].y;
                  }
                },
                getTouchedSpotIndicator: (barData, spotIndexes) {
                  return spotIndexes.map((e) {
                    return TouchedSpotIndicatorData(
                      FlLine(
                        color: const Color.fromRGBO(224, 43, 87, 1),
                        strokeWidth: 0.3,
                        dashArray: [4, 3],
                      ),
                      FlDotData(
                        getDotPainter: (p0, p1, p2, p3) {
                          return FlDotCirclePainter(
                            color: const Color.fromRGBO(224, 43, 87, 1),
                            strokeWidth: 0.3,
                          );
                        },
                      ),
                    );
                  }).toList();
                },
                getTouchLineEnd: (barData, spotIndex) => double.infinity,
                touchTooltipData: LineTouchTooltipData(
                  fitInsideHorizontally: true,
                  getTooltipItems: (touchedSpots) {
                    return [
                      LineTooltipItem(
                        DateFormat.yMMMd()
                            .format(
                              DateTime.fromMillisecondsSinceEpoch(
                                touchedSpots[0].x.toInt(),
                              ),
                            )
                            .toString()
                            .replaceAll('de ', ''),
                        TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ];
                  },
                  showOnTopOfTheChartBoxArea: true,
                  tooltipBgColor: Colors.transparent,
                  tooltipMargin: 10,
                  tooltipPadding: EdgeInsets.zero,
                  tooltipBorder: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots.sublist(0, days[selectedIndex.state]),
                  barWidth: 4,
                  color: const Color.fromRGBO(224, 43, 87, 1),
                  dotData: FlDotData(
                    show: false,
                  ),
                ),
              ],
              titlesData: FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  axisNameSize: 65,
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                  drawBehindEverything: true,
                  axisNameWidget: const TitleCryptoPrice(),
                ),
                bottomTitles: AxisTitles(
                  axisNameSize: 70,
                  axisNameWidget: const ButtonsChangeDaysChart(),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                drawHorizontalLine: false,
                horizontalInterval: 1,
              ),
            ),
          ),
        );
      },
      error: (error, stackTrace) => DefaultErrorPage(
        onPressed: () => ref.refresh(
          cryptoHistoryProvider(args.walletCryptoEntity.crypto.id),
        ),
      ),
      loading: () => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 300,
          width: double.maxFinite,
        ),
      ),
    );
  }
}
