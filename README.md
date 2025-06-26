# Traxpend 💰
**Track your expenses with ease**  
A modern, intuitive expense tracking mobile application built with Flutter that helps you manage your finances with ease.

Features ✨

✅ Add & Manage Expenses – Track daily spending with ease
✅ Firebase Backend – Real-time sync across devices
✅ Monthly Insights – Visualize spending patterns
✅ Dark/Light Mode – Eye-friendly themes
✅ Localization – Supports multiple languages
✅ Bloc State Management – Clean and scalable architecture

Tech Stack 🛠️

Frontend: Flutter
State Management: Flutter Bloc
Backend: Firebase (Auth, Firestore, Storage)
Localization: EasyLocalization
Dependency Injection: GetIt
Database: Hive (Offline caching)
UI: Cupertino & Material Design
Project Structure (Clean Architecture) 🏗️

traxpend/
├── android/                # Android platform-specific files
├── ios/                    # iOS platform-specific files
├── lib/                    # Core application code
│   ├── core/               # Shared app infrastructure
│   │   ├── config/         # App configuration (constants, env)
│   │   ├── di/             # Dependency injection (GetIt setup)
│   │   ├── router/         # Navigation/routes (GoRouter, etc.)
│   │   ├── theme/          # App themes (light/dark mode)
│   │   └── widgets/        # Reusable shared widgets
│   │
│   ├── features/           # Feature modules (Clean Architecture)
│   │   ├── auth/           # Authentication flow
│   │   │   ├── data/       # Auth data layer (repositories, datasources)
│   │   │   ├── domain/     # Auth domain layer (entities, use cases)
│   │   │   └── presentation/ # Auth UI & BLoCs
│   │   │
│   │   ├── expense/        # Expense tracking feature
│   │   │   ├── data/       # Expense data layer (Firebase/Hive)
│   │   │   ├── domain/     # Business logic (entities, use cases)
│   │   │   └── presentation/ # UI & BLoCs
│   │   │
│   │   └── settings/       # User settings feature
│   │
│   └── main.dart           # App entry point
│
├── assets/                 # Static files (images, fonts, etc.)
│   ├── images/             # App images (PNGs, SVGs)
│   └── translations/       # Localization files (JSON/arb)
│
├── test/                   # Unit/widget tests
├── web/                    # Web-specific files
├── linux/                  # Linux platform files
├── macos/                  # macOS platform files
├── windows/                # Windows platform files
│
├── .gitignore              # Git exclusion rules
├── pubspec.yaml            # Dependencies & metadata
└── analysis_options.yaml   # Linting/static analysis config         



## 📱 App Screenshots

<div align="center">
  <img src="https://github.com/nmustakim/traxpend/blob/main/1.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/2.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/3.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/4.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/5.png?raw=true" width="180"/>
</div>
