//set Expense Catagori
import 'dart:ui';

enum ExpenseCategory {
  food,
  transport,
  health,
  shopping,
  subscription,
}

//set expenses image
final Map<ExpenseCategory, String> expenseCategoryImages = {
  ExpenseCategory.food: "assets/img/restaurant.png",
  ExpenseCategory.transport: "assets/img/car.png",
  ExpenseCategory.health: "assets/img/health.png",
  ExpenseCategory.shopping: "assets/img/bag.png",
  ExpenseCategory.subscription: "assets/img/bill.png",
};

//set expenses color
final Map<ExpenseCategory, Color> expenseCategoryColors = {
  ExpenseCategory.food: const Color(0xFFE57373),
  ExpenseCategory.transport: const Color(0xFF81C784),
  ExpenseCategory.health: const Color(0xFF64B5F6),
  ExpenseCategory.shopping: const Color(0xFFFFD54F),
  ExpenseCategory.subscription: const Color(0xFF9575CD),
};

final class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  //Careate the Expense object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "amount": amount,
      "category": category.index,
      "date": date.toIso8601String(),
      "time": time.toIso8601String(),
      "description": description,
    };
  }

  //Create the expense object form a JSON object
  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json["id"],
      title: json["title"],
      amount: json["amount"],
      category: ExpenseCategory.values[json["category"]],
      date: DateTime.parse(json["date"]),
      time: DateTime.parse(json["time"]),
      description: json["description"],
    );
  }
}
