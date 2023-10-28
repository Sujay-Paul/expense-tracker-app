import 'package:flutter/material.dart';

import 'package:expense_tracker/widgets/expense_tracker.dart';

void main () {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const ExpenseTracker(),
    ),
  );
}