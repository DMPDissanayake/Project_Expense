//Income catagory
import 'dart:ui';

enum IncomeCategory {
  freelance,
  salary,
  passive,
  sales,
}

//set income catagory image
final Map<IncomeCategory, String> incomeCategoryImages = {
  IncomeCategory.freelance: "assets/img/freelance.png",
  IncomeCategory.passive: "assets/img/car.png",
  IncomeCategory.salary: "assets/img/health.png",
  IncomeCategory.sales: "assets/img/salary.png",
};

//set income color
final Map<IncomeCategory, Color> incomeCategoryColors = {
  IncomeCategory.freelance: const Color(0xFFE57373),
  IncomeCategory.passive: const Color(0xFF81C784),
  IncomeCategory.sales: const Color(0xFF64B5F6),
  IncomeCategory.salary: const Color(0xFFFFD54F),
};

final class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeCategory category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
