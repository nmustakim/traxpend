import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/theme_bloc.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/expense/presentation/bloc/expense_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const Traxpend());
}

class Traxpend extends StatelessWidget {
  const Traxpend({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<AuthBloc>()),
        BlocProvider(create: (_) => di.sl<ExpenseBloc>()),
        BlocProvider(create: (_) => di.sl<ThemeBloc>()), // Add ThemeBloc
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Traxpend',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: state.themeMode,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}