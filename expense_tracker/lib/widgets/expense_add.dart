import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/data/expenses_data.dart';


class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd(this.resetList,{super.key});

  final void Function() resetList;

  @override
  State<ExpenseAdd> createState() {
    return _ExepnseAddState();
  }
}

class _ExepnseAddState extends State<ExpenseAdd> {

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _savedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _saveDate() async {
    final now = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    setState(() {
      _savedDate = pickedDate;
    });
  }

  void _saveExpense() {
    final savedAmount = double.tryParse(_amountController.text);
    final invalidAmount = savedAmount == null || savedAmount <= 0;

    if (_titleController.text.isEmpty || invalidAmount || _savedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Inavlid Input"),
          content: const Text(
              "Please make sure you have enterd valid Title, Amount and Date."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Cancel'),
            )
          ],
        ),
      );
      return;
    }

    expensesData.add(ExpenseModel(
    title: _titleController.text,
    amount: savedAmount,
    dateandtime: _savedDate!,
    category: _selectedCategory),
    );
    Navigator.pop(context);
    widget.resetList();
  }
  // String title = '';
  // void _saveTitle(String enteredTitle) {
  //   title = enteredTitle;
  // }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25,48,25,30),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveTitle,
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text('₹ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _savedDate == null
                          ? 'No Selected Date'
                          : formatter.format(_savedDate!),
                    ),
                    IconButton(
                      onPressed: () {
                        return _saveDate();
                      },
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text("Save Changes"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
