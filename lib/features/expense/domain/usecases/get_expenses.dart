
import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpenses {
  final ExpenseRepository repository;

  GetExpenses(this.repository);

  Stream<List<Expense>> call(String userId) {
    return repository.getExpenses(userId);
  }
}
