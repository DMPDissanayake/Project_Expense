import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_expense/Constants/colors.dart';
import 'package:project_expense/Constants/constants.dart';
import 'package:project_expense/Models/expense_mode.dart';
import 'package:project_expense/Models/income_mode.dart';
import 'package:project_expense/Widgets/main_button.dart';

class AddNew extends StatefulWidget {
  const AddNew({super.key});

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  //set page
  int _viewPage = 0;
  //set the dropdown value
  ExpenseCategory _expenseCategory = ExpenseCategory.health;
  IncomeCategory _incomeCategory = IncomeCategory.freelance;

  //set date and time
  DateTime _setDate = DateTime.now();
  DateTime _setTime = DateTime.now();

  //pass controler
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  //dispose
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _viewPage == 0 ? kRed : kGreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefalutPadding,
            ),
            child: Stack(
              children: [
                //Top part
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _viewPage = 0;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _viewPage == 0 ? kRed : kWhite,
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Text(
                                  "Expense",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: _viewPage == 0 ? kWhite : kBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _viewPage = 1;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: _viewPage == 1 ? kGreen : kWhite,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Center(
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: _viewPage == 1 ? kWhite : kBlack,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //2nd part
                Padding(
                  padding: const EdgeInsets.all(kDefalutPadding),
                  child: Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "How much?",
                          style: TextStyle(
                            color: kLightGrey.withOpacity(0.8),
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 60,
                            color: kLightGrey,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              hintText: "0",
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                fontSize: 60,
                                color: kWhite,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.63,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
                    child: Form(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          DropdownButtonFormField(
                            decoration: InputDecoration(
                              hintText: _viewPage == 0
                                  ? "Select Expense Category"
                                  : "Select Income Category",
                              hintStyle: TextStyle(
                                  fontStyle: FontStyle.italic), // Add this line
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                            items: _viewPage == 0
                                ? ExpenseCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                : IncomeCategory.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _viewPage == 0
                                    ? _expenseCategory =
                                        value as ExpenseCategory
                                    : _incomeCategory = value as IncomeCategory;
                              });
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _titleController,
                            decoration: InputDecoration(
                              hintText: "title",
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kBlack.withOpacity(0.5),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 15),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _descriptionController,
                            decoration: InputDecoration(
                              hintText: "description",
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kBlack.withOpacity(0.5),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "amount",
                              hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kBlack.withOpacity(0.5),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2030),
                                  ).then((onValue) {
                                    if (onValue != null) {
                                      setState(() {
                                        _setDate = onValue;
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kMainColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 30,
                                          color: kWhite,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Select Date",
                                          style: TextStyle(
                                            color: kWhite,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.yMMMd().format(_setDate),
                                style: TextStyle(
                                  color: kBlack.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((onValue) {
                                    if (onValue != null) {
                                      setState(() {
                                        _setTime = DateTime(
                                            _setDate.year,
                                            _setDate.month,
                                            _setDate.day,
                                            onValue.hour,
                                            onValue.minute);
                                      });
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kYellow,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.alarm,
                                          size: 30,
                                          color: kWhite,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Select Time",
                                          style: TextStyle(
                                            color: kWhite,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                DateFormat.jm().format(_setTime),
                                style: TextStyle(
                                  color: kBlack.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: kLightGrey,
                            thickness: 5,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: MainButton(
                              bColor: _viewPage == 0 ? kRed : kGreen,
                              text: 'Add',
                            ),
                          )
                        ],
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
