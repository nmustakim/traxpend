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

  Future<void> _onLoadExpenses(LoadExpenses event, Emitter<ExpenseState> emit) async {
    emit(ExpenseLoading());

    try {

      final expenses = await _expenseRepository.getExpenses(event.userId).first;

      if (!emit.isDone) {
        emit(ExpenseLoaded(expenses));
      }
    } catch (e) {
      print(e.toString());
      if (!emit.isDone) {

        emit(ExpenseError(e.toString()));
      }
    }
  }

  Future<void> _onAddExpense(AddExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.addExpense(event.expense);


      final currentState = state;
      if (currentState is ExpenseLoaded) {

        add(LoadExpenses(event.expense.userId));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }
    }
  }

  Future<void> _onUpdateExpense(UpdateExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.updateExpense(event.expense);

      final currentState = state;
      if (currentState is ExpenseLoaded) {
        add(LoadExpenses(event.expense.userId));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }
    }
  }

  Future<void> _onDeleteExpense(DeleteExpense event, Emitter<ExpenseState> emit) async {
    try {
      await _expenseRepository.deleteExpense(event.id);

      // Reload expenses after deleting
      final currentState = state;
      if (currentState is ExpenseLoaded) {
  // add(LoadExpenses(event.userId));
      }
    } catch (e) {
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }
    }
  }
}