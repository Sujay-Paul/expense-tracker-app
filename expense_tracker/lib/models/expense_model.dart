import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/data/expenses_data.dart';

const uuid = Uuid();
final formatter = DateFormat.yMd();
enum Category {food, travel, leisure, work}

const categoryIcons = {
  Category.food : Icons.food_bank,
  Category.travel : Icons.airplane_ticket,
  Category.leisure : Icons.wallet_rounded,
  Category.work : Icons.work,
};

class ExpenseModel{
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.dateandtime,
    required this.category
    }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime dateandtime;
  final Category category;

  String get date{
    return formatter.format(dateandtime);}

}

class ExpenseChart{

  List<double> get barHeights {
    
    double maximumExpense = 0;
    final int l = Category.values.length;
    List<double> heightList = [];
  

    for (final category in Category.values) {

      double sum = 0;

      for (final expenses in expensesData) {
        if (expenses.category == category) {
          sum += expenses.amount;
        }
      }

      heightList.add(sum);
      if (maximumExpense < sum) {maximumExpense = sum;}

    }

    if (maximumExpense==0) {return List.filled(l, 0);}

    heightList = [for (final height in heightList) height/maximumExpense];
    return heightList;
    
  }
}