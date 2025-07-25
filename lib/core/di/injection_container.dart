import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/auth/data/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/expense/data/repositories/expense_repository_impl.dart';
import '../../features/expense/domain/repositories/expense_repository.dart';
import '../../features/expense/presentation/bloc/expense_bloc.dart';
import '../theme/theme_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);


  sl.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(sl()),
  );

  sl.registerLazySingleton<ExpenseRepository>(
        () => ExpenseRepositoryImpl(sl()),
  );


  sl.registerFactory(() => AuthBloc(sl()));
  sl.registerFactory(() => ExpenseBloc(sl()));

  sl.registerSingleton<ThemeBloc>(
    ThemeBloc(sharedPreferences: sl()),
  );
}
