# 🥒 Rick and Morty App

A high-performance Flutter application that explores the universe of *Rick and Morty*. This project demonstrates **Clean Architecture**, robust **State Management**, and **Local Persistence**.

## 🚀 Features
* **Character Browsing:** Browse a complete list of characters fetched from the official Rick and Morty API.
* **Persistent Theming:** Toggle between **Dark and Light modes** with a custom switch. Your preference is saved locally using **Hydrated BLoC**, so it stays saved even after closing the app.
* **Dynamic Pagination:** Seamlessly navigate through character pages using "Next" and "Previous" controls.
* **Detailed Profiles:** View in-depth information for each character, including Status, Species, Gender, and Origin.
* **Smart Image Caching:** Implements `CachedNetworkImage` to optimize performance and handle slow connections.
* **Fluid Animations:** Uses `Hero Animations` for premium transitions between the list and details view.
* **Type-Safe Enums:** Robust handling of API data with fallback values (`UNKNOWN`) to prevent crashes.

## 🛠 Tech Stack
* **Framework:** [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
* **State Management:** [Flutter Bloc / Cubit](https://pub.dev/packages/flutter_bloc) (Multi-Cubit Architecture)
* **Local Persistence:** [Shared_Preferences](https://pub.dev/packages/shared_preferences)
* **Networking:** [Http](https://pub.dev/packages/http)
* **Image Management:** [Cached Network Image](https://pub.dev/packages/cached_network_image)

## 📁 Project Structure
```text
lib/
├── business_logic/
│   └── cubit/
│       ├── characters/        # CharactersCubit & States
│       └── theme/             # Persistent ThemeCubit (Hydrated)
├── constants/
│   └── strings.dart           # API endpoints and Route names
├── data/
│   ├── models/                # Data models and JSON serialization
│   ├── repository/            # Abstract layer between Web Services and Cubit
│   └── web_services/          # Direct API communication (HTTP requests)
├── presentation/
│   ├── screens/               # UI Screens (Home, Details, Settings)
│   └── widgets/               # Reusable UI components
├── app_router.dart            # Centralized Navigation & Route Generation
└── main.dart                  # Storage initialization and App Entry
