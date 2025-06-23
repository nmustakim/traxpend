
import 'package:go_router/go_router.dart';
import 'package:traxpend/features/settings/presentation/pages/settings_page.dart';
import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/expense/presentation/pages/home_page.dart';
import '../../features/expense/presentation/pages/add_expense_page.dart';
import '../../features/expense/presentation/pages/statistics_page.dart';
import '../../features/expense/presentation/pages/profile_page.dart';
import '../widgets/main_wrapper.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth',
    routes: [
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainWrapper(child: child),
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/add',
            builder: (context, state) => const AddExpensePage(),
          ),
          GoRoute(
            path: '/statistics',
            builder: (context, state) => const StatisticsPage(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(path: '/settings',
          builder: (context,state)=>const SettingsScreen())
        ],
      ),
    ],
  );
}
