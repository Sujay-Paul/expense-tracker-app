import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense_model.dart';

class Chart extends StatefulWidget {
  const Chart(this.resetList,{super.key});

  final void Function() resetList;

  @override
  State<Chart> createState() {
    return _Chart();
  }
}

class _Chart extends State<Chart> {

  static const double barMaxHeight = 120;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: barMaxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: ExpenseChart()
                .barHeights
                .map(
                  (ratio) => Container(
                    height: ratio * barMaxHeight,
                    width: 75,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 126, 98, 251),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: categoryIcons.values
              .toList()
              .map(
                (icon) => Icon(
                  icon,
                  color: const Color.fromARGB(255, 126, 98, 251),
                  size: 25,
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
