# 📝 Flutter Notes App (with Firebase)

A Flutter note-taking application developed as part of the **"Working with Firebase"** exercise.  
This app lets users create, view, and delete personal notes stored in **Cloud Firestore**, with user authentication handled via **Firebase Authentication** (anonymous sign-in).

---

## 🚀 Features

- ✍️ Create and delete personal notes  
- ☁️ Persistent cloud storage using **Cloud Firestore**  
- 👤 Anonymous sign-in with **Firebase Authentication**  
- 🔒 Firestore security rules that restrict access to user-specific data  
- 🧩 State management with [GetX](https://pub.dev/packages/get)

---

## 📂 Project structure

```
lib/
├── controllers/
│   ├── note_controller.dart
│   └── user_controller.dart
├── models/
│   └── note.dart
├── screens/
│   ├── login_screen.dart
│   └── note_screen.dart
├── firebase_options.dart
└── main.dart
```

---

## ⚙️ Getting started

### 1️⃣ Clone the repository
```bash
git clone https://github.com/matteocivitillo/flutter_notes_app_firebase.git
cd flutter_notes_app_firebase
```

### 2️⃣ Install dependencies
```bash
flutter pub get
```

### 3️⃣ Connect to Firebase

Create a project in the [Firebase console](https://console.firebase.google.com/) and link your Flutter app following the official guide:

📘 [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup)

Then run:

```bash
flutterfire configure
```

This will generate:

```
lib/firebase_options.dart
```

> ⚠️ Do NOT commit real credentials to public repositories. Remove private keys or replace them with “REDACTED”.

---

## 🔥 Firebase setup

### Cloud Firestore

- Create a Firestore database (for development you can start in **Test mode**).
- Add a collection named `notes`; adding a sample document is optional.

### Firestore security rules

To ensure each user can only read/write their own notes, use rules like:

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /notes/{noteId} {
      allow read, delete: if request.auth != null && request.auth.uid == resource.data.userId;
      allow create: if request.auth != null && request.auth.uid == request.resource.data.userId;
    }
  }
}
```

---

## 🧠 Technologies used

| Technology          | Purpose                                   |
| ------------------- | ----------------------------------------- |
| **Flutter**         | Cross-platform UI framework               |
| **GetX**            | State management and dependency injection |
| **Firebase Core**   | Firebase initialization                   |
| **Cloud Firestore** | Cloud NoSQL database                      |
| **Firebase Auth**   | Anonymous user authentication             |

---

## 🏁 License

This project was created for educational purposes.  
© 2025 Matteo Civitillo — All rights reserved.
