import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controllers/cryptos/cryptos_provider.dart';
import '../../../../shared/controllers/visibility_provider.dart';

class TotalWalletValue extends HookConsumerWidget {
  const TotalWalletValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(cryptosProvider);
    final visibility = ref.watch(visibilityProvider);

    return Visibility(
      visible: visibility,
      replacement: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: wallet.when(
        data: (data) {
          return Text(
            NumberFormat.currency(symbol: 'R\$', decimalDigits: 2).format(
              data.getWalletValue().toDouble(),
            ),
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
            ),
          );
        },
        error: (error, stackTrace) => Container(),
        loading: () => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 34,
            width: MediaQuery.of(context).size.width * 0.5,
          ),
        ),
      ),
    );
  }
}
