import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';


part 'expense_state.dart';
part 'expense_event.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository _expenseRepository;

  ExpenseBloc(this._expenseRepository) : super(ExpenseInitial()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<UpdateExpense>(_onUpdateExpense);
    on<DeleteExpense>(_onDeleteExpense);
  }

  void _onLoadExpenses(LoadExpenses event, Emitter<ExpenseState> emit) {
    emit(ExpenseLoading());
    try {
      _expenseRepository.getExpenses(event.userId).listen(
            (expenses) => emit(ExpenseLoaded(expenses)),
        onError: (error) => emit(ExpenseError(error.toString())),
      );
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> _onAddExpense(AddExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.addExpense(event.expense);
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> _onUpdateExpense(UpdateExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.updateExpense(event.expense);
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }

  Future<void> _onDeleteExpense(DeleteExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.deleteExpense(event.id);
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
}