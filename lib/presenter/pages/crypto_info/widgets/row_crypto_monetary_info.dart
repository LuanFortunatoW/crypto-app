import 'package:crypto_app/shared/controllers/visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RowCryptoMonetaryInfo extends HookConsumerWidget {
  const RowCryptoMonetaryInfo({
    required this.label,
    required this.text,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String text;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visibility = ref.watch(visibilityProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 19,
              color: Color.fromRGBO(117, 118, 128, 1),
            ),
          ),
          Visibility(
            replacement: Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            visible: visibility,
            child: Text(
              text,
              style: TextStyle(
                fontSize: 19,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
