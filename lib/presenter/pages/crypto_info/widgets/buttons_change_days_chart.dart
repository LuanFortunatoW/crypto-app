import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controllers/chart_days_amount/chart_days_amount_provider.dart';

class ButtonsChangeDaysChart extends HookConsumerWidget {
  const ButtonsChangeDaysChart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<int> days = [5, 15, 30, 45, 90];

    final selectedIndex = ref.watch(daysAmountProvider.state);

    return ListView.builder(
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
                color:
                    index == selectedIndex.state ? Colors.black : Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}
