# 🥒 Rick and Morty App

A high-performance Flutter application that explores the universe of *Rick and Morty*. This project demonstrates **Clean Architecture**, robust **State Management**, and efficient **API Integration**.



## 🚀 Features
* **Character Browsing:** Browse a complete list of characters fetched from the official Rick and Morty API.
* **Dynamic Pagination:** Seamlessly navigate through pages using "Next" and "Previous" controls.
* **Detailed Profiles:** View in-depth information for each character, including Status, Species, Gender, and Origin.
* **Smart Image Caching:** Implements `CachedNetworkImage` to optimize performance, handle slow connections, and reduce API hits (preventing 429 errors).
* **Fluid Animations:** Uses `Hero Animations` for a premium feel when transitioning from the list to the details view.
* **Type-Safe Enums:** Robust handling of API data with fallback values (`UNKNOWN`) to prevent crashes from unexpected server responses.

## 🛠 Tech Stack
* **Framework:** [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)
* **State Management:** [Flutter Bloc / Cubit](https://pub.dev/packages/flutter_bloc)
* **Networking:** [Http](https://pub.dev/packages/http)
* **Image Management:** [Cached Network Image](https://pub.dev/packages/cached_network_image)
* **Architecture:** Clean Architecture (Data, Business Logic, and Presentation layers)



## 📁 Project Structure
```text
lib/
├── business_logic/
│   └── cubit/             # App state logic (CharactersCubit & States)
├── constants/
│   └── strings.dart       # API endpoints and Route names
├── data/
│   ├── models/            # Data models and JSON serialization
│   ├── repository/        # Abstract layer between Web Services and Cubit
│   └── web_services/      # Direct API communication (HTTP requests)
├── presentation/
│   ├── screens/           # Main UI Screens (Home & Details)
│   └── widgets/           # Reusable UI components
├── app_router.dart        # Centralized Navigation & Route Generation
└── main.dart              # The main file that run from it
