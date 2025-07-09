# 🏋️ AmperaVision – On-Site Task

functionality**.

---


## 🧱 Architecture

The app follows **Clean Architecture** principles:

### 🗂️ State Management

Utilizes the [Bloc] pattern for scalable and predictable state handling.

---

## 📁 Folder Structure

lib/
├── config/ # App-wide configuration
│ ├── router/ # Routing and navigation
│ └── injectable.dart # Dependency injection setup
├── utils/ # Common utilities
│ ├── extensions.dart
│ ├── data_state.dart # Unified communication objects between the repositories and blocs
│ └── base_api_repository.dart # Unified communication method between repositories and datasources
├── features/ # Feature-based modules
│ ├── booking/ # Booking-related screens, BLoCs, models
│ └── locations/ # Locations info-related logic and UI
├── styles/ # Colors, fonts, and shared widgets


## Running the Project

Follow these steps to set up and run the app locally:

```bash
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
