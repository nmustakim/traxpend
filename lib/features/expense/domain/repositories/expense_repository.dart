import '../entities/expense.dart';

abstract class ExpenseRepository {
  Stream<List<Expense>> getExpenses(String userId);
  Future<void> addExpense(Expense expense);
  Future<void> updateExpense(Expense expense);
  Future<void> deleteExpense(String id);
}