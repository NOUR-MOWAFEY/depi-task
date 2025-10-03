# Flutter Authentication & Populars App

This Flutter app demonstrates authentication, registration, and data fetching with smooth UI animations. It is built using **Bloc/Cubit state management** for clean separation of logic and UI.

---

## Features

* **Authentication Flow**

  * On startup, the app checks if the user is authenticated.
  * If authenticated → navigates to the **Home Screen**.
  * If not authenticated → navigates to the **Login Screen**.

* **Home Screen**

  * Shows a list of "populars" with:

    * Name
    * Image
    * Description
  * Items are displayed with a **fade-in opacity animation**.
  * Uses a dedicated **PopularCubit** to manage fetching and state.

* **Register Screen**

  * Handles user registration.
  * State management:

    * **Loading** → shows a loading screen.
    * **Success** → shows a success snackbar and navigates back to the Login Screen.
    * **Failure** → shows an error snackbar with the failure message.

* **Error & Loading Handling**

  * Centralized error handling with snackbars for authentication and registration.
  * Dedicated loading widgets for better user experience.

---

## State Management

* **AuthCubit**

  * Handles user authentication and login/logout states.
  * Emits:

    * `AuthInitial`, `AuthLoading`, `AuthAuthenticated`, `AuthUnAuthenticated`.

* **PopularCubit**

  * Handles fetching of "populars" data.
  * Emits:

    * `PopularLoading` → while fetching data.
    * `PopularSuccess` → when data is successfully loaded.
    * `PopularFailed` → when fetching data fails.

---

## UI Flow

1. **AuthGate** (root screen)

   * Shows `LoadingScreen` while checking state.
   * Navigates to:

     * `HomeScreen` if authenticated.
     * `LoginScreen` if not authenticated.

2. **HomeScreen**

   * Displays list of popular items with opacity animation.
   * Can navigate to **RegisterScreen**.

3. **RegisterScreen**

   * On success → Snackbar + Navigate to Login.
   * On error → Snackbar with error message.

---

## Tech Stack

* **Flutter** (UI framework)
* **flutter_bloc** (state management)
* **Material Design** (UI components)
