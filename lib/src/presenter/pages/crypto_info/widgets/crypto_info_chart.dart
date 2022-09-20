import 'package:crypto_app/src/presenter/controllers/crypto_history/crypto_history_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final indexProvider = StateProvider<int>((ref) => 0);

final priceProvider =
    StateProvider<double>(((ref) => ref.watch(defaultPriceProvider)));
final defaultPriceProvider = StateProvider<double>(((ref) => 0));

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

    debugPrint(spots.length.toString());
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    final List<int> days = [5, 15, 30, 45, 90];
    final selectedIndex = ref.watch(indexProvider.state);
    final price = ref.watch(priceProvider.state);
    final defauiltPrice = ref.watch(defaultPriceProvider.state);

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
              if (response != null) {
                price.state = response.lineBarSpots![0].y;
              }

              if (!event.isInterestedForInteractions) {
                price.state = defauiltPrice.state;
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
                    (DateTime.fromMillisecondsSinceEpoch(
                            touchedSpots[0].x.toInt())
                        .toString()),
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
                  children: const [
                    Text(
                      'R\$ 104.159.477,00',
                      style: TextStyle(
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
