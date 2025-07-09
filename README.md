# 🏋️ AmperaVision – On-Site Task

functionality**.

---


## 🧱 Architecture

The app follows **Clean Architecture** principles:

### 🗂️ State Management

Utilizes the [Bloc] pattern for scalable and predictable state handling.

---

## 📁 Folder Structure

```text

lib/
├── config/               # App configuration: routing, dependency injection
├── features/             # Feature-based structure (booking, locations, etc.)
├── styles/               # App styling (colors, fonts, general widgets)
├── utils/                # Shared utility classes & extensions
│   ├── extensions.dart
│   ├── data_state.dart           # Unified communication objects between repositories and blocs(cubits)
│   └── base_api_repository.dart  # Unified communication method between datasources and repositories
```
---

## Running the Project

Follow these steps to set up and run the app locally:

```bash
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
