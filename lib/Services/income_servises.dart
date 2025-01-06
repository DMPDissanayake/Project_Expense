import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_expense/Models/income_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeServises {
  //income list
  List<Income> incomeList = [];

  //define the key for storing income in shared preferences
  static const String _incomeKey = "income";

  //save the income to shared preferences
  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      //get the data by pref
      List<String>? existingIncom = pref.getStringList(_incomeKey);

      //Convert to the sxisting income list to a income object
      List<Income> existingIncomObject = [];
      if (existingIncom != null) {
        existingIncomObject =
            existingIncom.map((e) => Income.fromJson(jsonDecode(e))).toList();
      }
      //add the new income to the list
      existingIncomObject.add(income);
      List<String>? updatedeExistingIncom =
          existingIncomObject.map((e) => jsonEncode(e.toJson())).toList();

      //save the update list of income to shared preferences
      await pref.setStringList(_incomeKey, updatedeExistingIncom);

      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Save..."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      //show message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Not Save!!."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  //load the income form shard pref
  Future<List<Income>> loadedIncome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingIncome = pref.getStringList(_incomeKey);

    List<Income> loadedIncome = [];
    if (existingIncome != null) {
      loadedIncome =
          existingIncome.map((e) => Income.fromJson(json.decode(e))).toList();
    }
    return loadedIncome;
  }

  //Income Item Delete
  Future<void> deleteIncome(int id, BuildContext context) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      List<String>? exsistingIncome = pref.getStringList(_incomeKey);
      List<Income> exsistingIncomeObject = [];
      if (exsistingIncome != null) {
        exsistingIncomeObject =
            exsistingIncome.map((e) => Income.fromJson(jsonDecode(e))).toList();
      }
      exsistingIncomeObject.removeWhere((element) => element.id == id);
      List<String> updatedIncome =
          exsistingIncomeObject.map((e) => json.encode(e.toJson())).toList();
      await pref.setStringList(_incomeKey, updatedIncome);
      //show Message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Itme is Delete.."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      //show Message
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income Itme is Not Delete.."),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }
}
