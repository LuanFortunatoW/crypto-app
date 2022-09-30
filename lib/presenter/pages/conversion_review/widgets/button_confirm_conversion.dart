import '../../../../domain/entities/conversion_entity.dart';
import '../../../controllers/transactions/all_transactions_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtonConfirmConversion extends HookConsumerWidget {
  const ButtonConfirmConversion({
    Key? key,
    required this.conversionEntity,
  }) : super(key: key);

  final ConversionEntity conversionEntity;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(allTransactionsProvider.state);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/conversion_confirmation');
          transactions.state.add(conversionEntity);
        },
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        color: const Color.fromRGBO(224, 43, 87, 1),
        minWidth: double.maxFinite,
        height: 56,
        child: const Text(
          'Concluir conversão',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
