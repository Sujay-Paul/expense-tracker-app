import 'package:flutter/material.dart';

import 'package:expense_tracker/home-screen/expense_items.dart';
import 'package:expense_tracker/data/expenses_data.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(this.resetList, {super.key});

  final void Function() resetList;

  @override
  State<ExpensesList> createState() {
    return _ExpensesListState();
  }
}

class _ExpensesListState extends State<ExpensesList> {
  final data = expensesData;
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (ctx, index) => Dismissible(
          background: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red[600],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          onDismissed: (direction) {
            var currentExpense= data[index];
            data.remove(currentExpense);
            widget.resetList();
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 3),
                content: const Text('Expense Deleted'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    data.insert(index,currentExpense);
                    widget.resetList();
                  },
                ),
              ),
            );
          },
          key: ValueKey(data[index]),
          child: ExpenseItems(data[index]),
        ),
      ),
    );
  }
}
