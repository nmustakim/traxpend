import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/expense.dart';
import '../../domain/repositories/expense_repository.dart';

part 'expense_state.dart';
part 'expense_event.dart';



class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepository expenseRepository;

  ExpenseBloc(this.expenseRepository) : super(ExpenseInitial()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<UpdateExpense>(_onUpdateExpense);
    on<DeleteExpense>(_onDeleteExpense);
  }

  Future<void> _onLoadExpenses(
      LoadExpenses event,
      Emitter<ExpenseState> emit,
      ) async {
    emit(ExpenseLoading());

    try {
      final expenses = await expenseRepository.getExpenses(event.userId).first;

      if (!emit.isDone) {
        emit(ExpenseLoaded(expenses));
      }
    } catch (e) {
      debugPrint('Error loading expenses: ${e.toString()}');
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }
    }
  }

  Future<void> _onAddExpense(
      AddExpense event,
      Emitter<ExpenseState> emit,
      ) async {
    try {
      await expenseRepository.addExpense(event.expense);

      final currentState = state;
      if (currentState is ExpenseLoaded) {
        final updatedExpenses = List<Expense>.from(currentState.expenses)
          ..add(event.expense);

        updatedExpenses.sort((a, b) => b.date.compareTo(a.date));

        emit(ExpenseLoaded(updatedExpenses));
      }
    } catch (e) {
      debugPrint('Error adding expense: ${e.toString()}');
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }

      final currentState = state;
      if (currentState is ExpenseLoaded && currentState.expenses.isNotEmpty) {
        add(LoadExpenses(currentState.expenses.first.userId));
      }
    }
  }

  Future<void> _onUpdateExpense(
      UpdateExpense event,
      Emitter<ExpenseState> emit,
      ) async {
    try {
      await expenseRepository.updateExpense(event.expense);

      final currentState = state;
      if (currentState is ExpenseLoaded) {
        final updatedExpenses = currentState.expenses.map((expense) {
          return expense.id == event.expense.id ? event.expense : expense;
        }).toList();

        updatedExpenses.sort((a, b) => b.date.compareTo(a.date));

        emit(ExpenseLoaded(updatedExpenses));
      }
    } catch (e) {
      debugPrint('Error updating expense: ${e.toString()}');
      if (!emit.isDone) {
        emit(ExpenseError(e.toString()));
      }

      final currentState = state;
      if (currentState is ExpenseLoaded && currentState.expenses.isNotEmpty) {
        add(LoadExpenses(currentState.expenses.first.userId));
      }
    }
  }

  Future<void> _onDeleteExpense(
      DeleteExpense event,
      Emitter<ExpenseState> emit,
      ) async {
    try {
      final currentState = state;

      if (currentState is ExpenseLoaded) {
        final updatedExpenses = currentState.expenses
            .where((expense) => expense.id != event.id)
            .toList();


        emit(ExpenseLoaded(updatedExpenses));

        await expenseRepository.deleteExpense(event.id);

        debugPrint('Expense deleted successfully: ${event.id}');
      }
    } catch (e) {
      debugPrint('Error deleting expense: ${e.toString()}');


      final currentState = state;
      if (currentState is ExpenseLoaded && currentState.expenses.isNotEmpty) {
        add(LoadExpenses(currentState.expenses.first.userId));
      }

      if (!emit.isDone) {
        emit(ExpenseError('Failed to delete expense: ${e.toString()}'));
      }
    }
  }


  String? get currentUserId {
    final currentState = state;
    if (currentState is ExpenseLoaded && currentState.expenses.isNotEmpty) {
      return currentState.expenses.first.userId;
    }
    return null;
  }


  void refreshExpenses() {
    final userId = currentUserId;
    if (userId != null) {
      add(LoadExpenses(userId));
    }
  }
}