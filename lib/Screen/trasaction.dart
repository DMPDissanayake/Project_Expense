import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Constants/constants.dart';
import 'package:project_expense/Models/expense_mode.dart';
import 'package:project_expense/Models/income_mode.dart';
import 'package:project_expense/Widgets/Expenses_card.dart';
import 'package:project_expense/Widgets/income_card.dart';

class Trasaction extends StatefulWidget {
  final List<Expense> expenseList;
  final void Function(Expense) removeExpenses;

  final List<Income> incomeList;
  final void Function(Income) removeIncome;

  const Trasaction({
    super.key,
    required this.expenseList,
    required this.incomeList,
    required this.removeExpenses,
    required this.removeIncome,
  });

  @override
  State<Trasaction> createState() => _TrasactionState();
}

class _TrasactionState extends State<Trasaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kDefalutPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "See your financial report",
                  style: TextStyle(
                    fontSize: 25,
                    color: kMainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Expenses",
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //Expenses View
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.expenseList.length,
                          itemBuilder: (context, index) {
                            final expenses = widget.expenseList[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Dismissible(
                                key: ValueKey(expenses.id),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (direction) {
                                  setState(() {
                                    widget.removeExpenses(expenses);
                                  });
                                },
                                child: ExpensesCard(
                                  title: expenses.title,
                                  description: expenses.description,
                                  amount: expenses.amount,
                                  stuationTime: expenses.time,
                                  catagory: expenses.category,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Income",
                  style: TextStyle(
                    fontSize: 20,
                    color: kBlack,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                //income View
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.incomeList.length,
                        itemBuilder: (context, index) {
                          final incomes = widget.incomeList[index];
                          return Dismissible(
                            key: ValueKey(incomes.id),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                widget.removeIncome(incomes);
                              });
                            },
                            child: IncomeCard(
                              title: incomes.title,
                              description: incomes.description,
                              amount: double.parse(
                                  incomes.amount.toStringAsFixed(2)),
                              stuationTime: incomes.time,
                              catagory: incomes.category,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
