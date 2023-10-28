import 'package:flutter/material.dart';

import 'package:expense_tracker/home-screen/expenses_list.dart';
import 'package:expense_tracker/data/expenses_data.dart';
import 'package:expense_tracker/home-screen/chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.resetList, {super.key});

  final void Function() resetList;

  @override
  Widget build(context) {
    final Widget expenseList = expensesData.isEmpty
        ? const Center(child: Text("No Expenses Added"))
        : ExpensesList(resetList);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 200,
            padding: const EdgeInsets.all(20),
            color: const Color.fromARGB(255, 209, 206, 248),
            child: Chart(resetList),
          ),
          Expanded(
            child: expenseList,
          ),
        ],
      ),
    );
  }
}
