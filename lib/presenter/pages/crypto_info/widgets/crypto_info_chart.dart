import 'package:crypto_app/presenter/controllers/chart_days_amount/chart_days_amount_provider.dart';
import 'package:crypto_app/presenter/controllers/chart_subtitles/variation_in_chart_provider.dart';
import 'package:crypto_app/presenter/controllers/crypto_history/crypto_history_provider.dart';
import 'package:crypto_app/presenter/controllers/chart_subtitles/price_in_chart_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class CryptoInfoChart extends StatefulHookConsumerWidget {
  const CryptoInfoChart({Key? key}) : super(key: key);

  @override
  ConsumerState<CryptoInfoChart> createState() => _CryptoInfoChartState();
}

class _CryptoInfoChartState extends ConsumerState<CryptoInfoChart> {
  late List<FlSpot> spots;

  @override
  void initState() {
    spots = getSpots();
    super.initState();
  }

  List<FlSpot> getSpots() {
    final cryptoHistory = ref.read(cryptoHistoryProvider);
    List<FlSpot> spots = [];
    cryptoHistory.forEach(
      (key, value) {
        spots.add(
          FlSpot(
            double.parse(
              key.millisecondsSinceEpoch.toString(),
            ),
            double.parse(
              value.price.toString(),
            ),
          ),
        );
      },
    );

    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final List<int> days = [5, 15, 30, 45, 90];

    final selectedIndex = ref.watch(daysAmountProvider.state);
    final price = ref.watch(priceInChartProvider.state);
    final variation = ref.watch(variationInChartProvider.state);

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
                  variation.state = (spots.first.y - spots[1].y) / spots[1].y;
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
              return [
                TouchedSpotIndicatorData(
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
                )
              ];
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
              axisNameWidget: Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Row(
                  children: [
                    Text(
                      NumberFormat.currency(symbol: 'R\$').format(
                        double.parse(price.state.toString()),
                      ),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              axisNameSize: 70,
              axisNameWidget: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() {
                      selectedIndex.state = index;
                    }),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 24,
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: index == selectedIndex.state
                            ? Colors.grey.shade300
                            : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '${days[index]}D',
                        style: TextStyle(
                          color: index == selectedIndex.state
                              ? Colors.black
                              : Colors.grey,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ),
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
  }
}
