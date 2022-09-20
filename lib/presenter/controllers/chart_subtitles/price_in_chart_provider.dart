import 'package:decimal/decimal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final priceInChartProvider = StateProvider<Decimal>(((ref) => Decimal.zero));
