import 'package:equatable/equatable.dart';

class Expense extends Equatable {
  final String id;
  final String title;
  final double amount;
  final String category;
  final DateTime date;
  final String? description;
  final String userId;

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    this.description,
    required this.userId,
  });

  @override
  List<Object?> get props => [id, title, amount, category, date, description, userId];
}
