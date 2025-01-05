import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_expense/Models/expense_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpensesServices {
  //expence list
  List<Expense> expensesList = [];

  //Define the key for storing expence in shared preferences
  static const String _expenceKey = "expenses";

  //save the expenses to shared preferences
  Future<void> saveExpenses(Expense expenses, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      List<String>? existingExpenses = pref.getStringList(_expenceKey);

      //Conver to the esisting expenses to a list of expenses objecct
      List<Expense> existingExpensesObject = [];

      if (existingExpenses != null) {
        existingExpensesObject = existingExpenses
            .map((e) => Expense.fromJson(json.decode(e)))
            .toList();
      }

      //add the new expenses to the list
      existingExpensesObject.add(expenses);

      //convert to the list of expenses object back to a list of string
      List<String> upDatedExpenses =
          existingExpensesObject.map((e) => jsonEncode(e.toJson())).toList();

      //Save the  updated list of expenses to shared preferences
      await pref.setStringList(_expenceKey, upDatedExpenses);

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expenses Add..."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expenses Add Error!."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //load the expenses from shard preferences
  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenceKey);

    //Conver to the sxisting expenses to a list of expense object
    List<Expense> loadedExpenses = [];
    if (existingExpenses != null) {
      loadedExpenses = existingExpenses
          .map((e) => Expense.fromJson(json.decode(e)))
          .toList();
    }
    return loadedExpenses;
  }
}
