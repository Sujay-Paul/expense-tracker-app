import 'package:expense_tracker/models/expense_model.dart';

List<ExpenseModel> expensesData = [

  ExpenseModel(
    title: "MacBook Screen",
    amount: 400,
    dateandtime: DateTime.now(),
    category: Category.work,
  ),

  ExpenseModel(
    title: "Pan Fried Momo",
    amount: 225,
    dateandtime: DateTime.now(),
    category: Category.food,
  ),

];