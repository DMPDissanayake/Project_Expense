import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Models/expense_mode.dart';

class ExpensesCard extends StatelessWidget {
  final ExpenseCategory catagory;
  final String title;
  final String description;
  final double amount;
  final DateTime stuationTime;
  const ExpensesCard({
    super.key,
    required this.title,
    required this.description,
    required this.amount,
    required this.stuationTime,
    required this.catagory,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 144, 144, 243).withOpacity(0.3),
        // boxShadow: [
        //   BoxShadow(
        //     color: kGrey.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 10,
        //     offset: const Offset(0, 1),
        //   ),
        // ],
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: expenseCategoryColors[catagory]!.withOpacity(0.3),
            ),
            child: Center(
              child: Image.asset(
                expenseCategoryImages[catagory]!,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length > 10 ? '${title.substring(0, 10)}...' : title,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: kBlack.withOpacity(0.8)),
                  ),
                  Text(
                    description.length > 15
                        ? '${description.substring(0, 15)}...'
                        : description,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: kGrey),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$ ${double.parse(amount.toStringAsFixed(2))}",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: expenseCategoryColors[catagory]!,
                ),
              ),
              Text(
                DateFormat.jm().format(stuationTime),
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: kGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
