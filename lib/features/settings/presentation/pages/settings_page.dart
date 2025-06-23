import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/theme_bloc.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            "Preferences",
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return _buildCard(
                context,
                icon: state.themeMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                title: "Theme",
                subtitle: state.themeMode == ThemeMode.dark
                    ? "Dark Mode"
                    : "Light Mode",
                onTap: () {
                  // Toggle between light and dark mode
                  context.read<ThemeBloc>().add(ThemeToggled());
                },
                trailing: Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ThemeToggled());
                  },
                  activeColor: theme.colorScheme.primary,
                ),
              );
            },
          ),
          _buildCard(
            context,
            icon: Icons.notifications,
            title: "Notifications",
            subtitle: "Manage notification preferences",
            onTap: () {
              // TODO: implement notifications
            },
          ),
          _buildCard(
            context,
            icon: Icons.lock,
            title: "Privacy",
            subtitle: "Security and privacy options",
            onTap: () {
              // TODO: implement privacy settings
            },
          ),
          const SizedBox(height: 24),
          Text(
            "About",
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          _buildCard(
            context,
            icon: Icons.info,
            title: "Version",
            subtitle: "1.0.0",
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Traxpend",
                applicationVersion: "1.0.0",
                applicationIcon: Image.asset(
                  'assets/images/logo.png', height: 60, width: 70,),
                children: const [
                  Text(
                      "Developed with profound love and dedication by N.Mustakim ❤️\n\n© All rights reserved."),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    Widget? trailing, // Added trailing parameter
  }) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: theme.cardTheme.shape,
      elevation: theme.cardTheme.elevation,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Icon(icon, color: theme.colorScheme.primary),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
