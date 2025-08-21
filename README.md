# Magic Workout App

A small, production-ready Flutter app to record workouts made of multiple sets. It showcases a clean, testable architecture with a reactive local database and modern routing.

## Demo

| iOS  | Android |
| :---------------: | :---------------: |
| [![]([https://github.com/loydkim/pixelfield_assessment/blob/main/demo/demo_iOS.gif](https://github.com/loydkim/magic_assessment/blob/main/demo/demo_ios.gif))]() | [![]([https://github.com/loydkim/pixelfield_assessment/blob/main/demo/demo_android.gif](https://github.com/loydkim/magic_assessment/blob/main/demo/demo_android.gif))]() |

---

## Table of Contents

* [Features](#features)
* [Tech Stack](#tech-stack)
* [Architecture & Rationale](#architecture--rationale)
* [Folder Structure](#folder-structure)
* [Data Model](#data-model)
* [Setup](#setup)
* [Run](#run)
* [Testing](#testing)
* [Integration Flow Covered](#integration-flow-covered)
* [Extensibility](#extensibility)

---

## Features

* Create, edit, and delete workouts.
* Each workout contains one or more sets (exercise, weight, reps, order).
* Reactive workout list (auto-updates on DB changes).
* Type-safe entities and states with code generation.
* End-to-end and widget/unit tests included.

---

## Tech Stack

* **Navigation:** `go_router`
* **State Management:** `flutter_bloc`
* **Data Classes & Unions:** `freezed` (+ `json_serializable`)
* **Local DB:** `drift` (SQLite)
* **Dependency Injection:** `get_it`
* **Testing:** `flutter_test`, `bloc_test`, `mocktail`, `integration_test`

---

## Architecture & Rationale

### Why these choices?

* **go\_router** — Declarative routing with clear URL patterns (`/workouts`, `/workouts/new`, `/workouts/:id`), deep links, and guards. Plays well with `MaterialApp.router` and state restoration.
* **flutter\_bloc** — Event→State flows are predictable and easy to test. It enforces a separation of concerns: UI dispatches events; BLoC orchestrates use cases; immutable states rebuild the UI.
* **freezed** — Immutable, value-based domain models with exhaustive unions for events/states. Less boilerplate, safer refactors, and strong typing for state machines.
* **drift** — Type-safe SQL with compile-time checks and reactive queries. Streams from Drift automatically refresh the list screen without manual polling. Transactions keep multi-row updates (e.g., replacing all sets) consistent.
* **get\_it** — A simple service locator to assemble DB, DAO, repositories, and use cases. Encourages testability via easy swapping of in-memory DB and fakes/mocks.

### Data flow (unidirectional)

```
Widgets (UI)
   └─ dispatch events
BLoC (Presentation)
   └─ invoke UseCases
Repository (Domain)
   └─ DAO (Drift)
SQLite (Drift)
   └─ Streams back to BLoC
BLoC emits State → UI rebuilds
```

This flow keeps UI logic thin, isolates side effects, and makes the codebase straightforward to test end-to-end.

---

## Folder Structure

```
lib/
├─ app.dart                     # MaterialApp.router wired to go_router
├─ bootstrap.dart               # DI init, BlocObserver, runZonedGuarded
├─ core/
│  ├─ router/                   # Routes + GoRouter configuration
│  ├─ di/                       # get_it registrations
│  ├─ db/                       # drift DB, tables, DAO
│  ├─ constants/                # exercises list
│  └─ widgets/                  # shared widgets (if any)
└─ features/
   └─ workout/
      ├─ domain/                # entities (freezed), repo contracts, use cases
      ├─ data/                  # mappers, local source, drift repository
      └─ presentation/          # blocs, pages, widgets
```

---

## Data Model

* **Workout**: `id`, `date`, `notes?`, `List<WorkoutSet> sets`
* **WorkoutSet**: `id`, `workoutId`, `exercise` (string), `weight` (double), `reps` (int), `order` (int)

**DB tables**

* `Workouts(id, date, notes)`
* `WorkoutSets(id, workoutId → Workouts.id, exercise, weight, reps, order)`
  Cascading delete ensures child sets are removed with their parent workout.

---

## Setup

> Requires Flutter 3.x / Dart 3.x

1. Install dependencies and generate code:

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

2. (Optional) Static analysis / formatting:

```bash
flutter analyze
dart format .
```

---

## Run

```bash
flutter run
```

Default routes:

* `/workouts` — list screen
* `/workouts/new` — editor (new)
* `/workouts/:id` — editor (existing)

---

## Testing

### Unit Tests

* DAO tests use **in-memory Drift** for deterministic SQL behavior.
* Repository tests verify mapping between Drift rows and domain entities.
* Use case tests ensure correct delegation to repositories.

Run:

```bash
flutter test
```

### Widget Tests

* Workout list: loading → renders items; swipe-to-delete; FAB navigation.
* Workout editor: new → add/update/remove set → save (SnackBar feedback).
* Stable finders (`byType`, `byIcon`) and small pump loops to avoid timing flakiness.

Run:

```bash
flutter test
```

> **Note for `mocktail` users:** when stubbing methods expecting `Workout`, register a fallback once:

```dart
setUpAll(() {
  registerFallbackValue(Workout(date: DateTime(2025, 1, 1), sets: const []));
});
```

---

## Integration Flow Covered

1. **Create**: Open `/workouts/new`, add a set, enter `weight` and `reps`, select `exercise`, **Save**.
2. **List**: Auto-refresh via Drift stream; count of sets displayed.
3. **Edit**: Tap list item → editor; modify and save.
4. **Delete**: Swipe list item to delete; list updates immediately.

---

## Extensibility

* **Cloud sync**: Add a remote data source and merge it within the repository; UI remains unchanged.
* **Analytics & crash reporting**: Hook into `bootstrap.dart`.
* **Performance**: Add indexes (e.g., `workoutId`, `date`) and pagination if history grows large.

---
