import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expense_add.dart';
import 'package:expense_tracker/widgets/home_screen.dart';
import 'package:expense_tracker/data/expenses_data.dart';
// import 'package:expense_tracker/models/expense_model.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() {
    return _ExpenseTrackerState();
  }
}

class _ExpenseTrackerState extends State<ExpenseTracker> {

  void addExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => ExpenseAdd(_resetList),
    );
  }

  void _resetList() {
    setState(() {
      expensesData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [
            IconButton(
              onPressed: addExpense,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      body: HomeScreen(_resetList),
      );
  }
}
