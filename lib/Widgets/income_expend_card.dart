import 'package:flutter/material.dart';
import 'package:project_expense/Constants/colors.dart';

class IncomeExpendCard extends StatefulWidget {
  final Color boxColor;
  final String trxt;
  final double amount;
  final String imageUrl;
  const IncomeExpendCard({
    super.key,
    required this.boxColor,
    required this.trxt,
    required this.amount,
    required this.imageUrl,
  });

  @override
  State<IncomeExpendCard> createState() => _IncomeExpendCardState();
}

class _IncomeExpendCardState extends State<IncomeExpendCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: widget.boxColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kWhite,
                ),
                child: Center(
                  child: Image.asset(
                    widget.imageUrl,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.trxt,
                    style: TextStyle(
                      fontSize: 15,
                      color: kWhite,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "\$ ${widget.amount.toStringAsFixed(0)}",
                    style: TextStyle(
                      fontSize: 20,
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
