import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense_model.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems(this.expenseItem, {super.key});

  final ExpenseModel expenseItem;

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:4,vertical:2),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 18, 12, 0),
              child: Text(
                expenseItem.title,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text('₹ ${expenseItem.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expenseItem.category]),
                      const SizedBox(width: 5),
                      Text(
                        expenseItem.date.toString(),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
