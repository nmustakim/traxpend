# Traxpend 💰
**Track your expenses with ease**  
A modern, intuitive expense tracking mobile application built with Flutter that helps you manage your finances efficiently — both online and offline.

---

## ✨ Features

- ✅ **Add & Manage Expenses** – Track daily spending effortlessly
- ✅ **Firebase Backend** – Real-time sync across devices using Firestore & Auth
- ✅ **Monthly Insights** – Visualize spending trends via charts
- ✅ **Dark/Light Mode** – Eye-friendly theming support
- ✅ **Offline Support** – Works without internet using shared preferences
- ✅ **Bloc State Management** – Clean and maintainable architecture

---

## 🛠️ Tech Stack

- **Frontend**: Flutter
- **Routing**: GoRouter
- **State Management**: Flutter Bloc
- **Backend**: Firebase Auth & Firestore
- **Dependency Injection**: GetIt
- **Charts**: FL Chart
- **Local Storage**: Shared Preferences
- **UI Toolkit**: Material & Cupertino

---

## 🏗️ Project Structure (Clean Architecture)

<pre>
traxpend/
├── android/
├── ios/
├── lib/
│   ├── core/
│   │   ├── config/
│   │   ├── di/
│   │   ├── router/
│   │   ├── theme/
│   │   └── widgets/
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── expense/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── settings/
│   └── main.dart
├── assets/
│   └── images/
</pre>

---

## 📱 App Screenshots

<p align="center">
  <img src="https://github.com/nmustakim/traxpend/blob/main/1.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/2.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/3.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/4.png?raw=true" width="180"/>
  <img src="https://github.com/nmustakim/traxpend/blob/main/5.png?raw=true" width="180"/>
</p>
