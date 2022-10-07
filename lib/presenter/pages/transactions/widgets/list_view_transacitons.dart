import 'package:crypto_app/presenter/pages/transactions/widgets/list_tile_transactions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/conversion_entity.dart';
import '../../../controllers/transactions/all_transactions_provider.dart';

class ListViewTransacitons extends HookConsumerWidget {
  const ListViewTransacitons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactions = ref.watch(allTransactionsProvider.state);

    return ListView.separated(
      itemCount: transactions.state.length,
      separatorBuilder: (context, index) {
        return const Divider(
          indent: 16,
          height: 10,
          thickness: 1,
        );
      },
      itemBuilder: (context, index) {
        ConversionEntity conversion = transactions.state[index];
        return ListTileTransactions(
          conversion: conversion,
        );
      },
    );
  }
}
