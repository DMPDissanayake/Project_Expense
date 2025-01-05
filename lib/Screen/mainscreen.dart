import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Models/expense_mode.dart';
import 'package:project_expense/Models/income_mode.dart';
import 'package:project_expense/Screen/add.dart';
import 'package:project_expense/Screen/buget.dart';
import 'package:project_expense/Screen/home.dart';
import 'package:project_expense/Screen/profile.dart';
import 'package:project_expense/Screen/trasaction.dart';
import 'package:project_expense/Services/expences_services.dart';
import 'package:project_expense/Services/income_servises.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  //Curent index
  int _currentPageIndex = 0;

  List<Expense> expenseList = [];
  List<Income> incomeList = [];

  //Funtion to fetch espense
  void fentchAllExpense() async {
    List<Expense> loadedExpense = await ExpensesServices().loadExpenses();
    setState(() {
      expenseList = loadedExpense;
      print(expenseList.length);
    });
  }

  //Funtion to fetch Income
  void fentchAllIncome() async {
    List<Income> loadedIncome = await IncomeServises().loadedIncome();
    setState(() {
      incomeList = loadedIncome;
      print(incomeList.length);
    });
  }

  //Add new expense
  void addNewExpense(Expense newExpense) {
    ExpensesServices().saveExpenses(newExpense, context);

    //update the list expenses
    setState(() {
      expenseList.add(newExpense);
    });
  }

  //add new Income
  void addNewIncome(Income newIncome) {
    IncomeServises().saveIncome(newIncome, context);
    //update the list income
    setState(() {
      incomeList.add(newIncome);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fentchAllExpense();
      fentchAllIncome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Home(),
      Trasaction(),
      AddNew(
        addExpense: addNewExpense,
        addIncome: addNewIncome,
      ),
      Bugets(),
      Profile(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        selectedLabelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        selectedIconTheme: IconThemeData(
          size: 25,
        ),
        currentIndex: _currentPageIndex,
        onTap: (value) {
          setState(() {
            _currentPageIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transaction",
          ),
          BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: kMainColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: kWhite,
                ),
              ),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket),
            label: "Budget",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: pages[_currentPageIndex],
    );
  }
}
