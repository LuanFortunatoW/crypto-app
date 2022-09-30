import 'package:hooks_riverpod/hooks_riverpod.dart';

final coingeckoBaseUrl = StateProvider(
  (ref) => 'https://api.coingecko.com/api/v3',
);
