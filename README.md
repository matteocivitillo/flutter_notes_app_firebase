# 📝 Flutter Notes App (con Firebase)

Applicazione Flutter per prendere appunti, sviluppata come esercizio del corso **"Working with Firebase"**.  
L'app permette di creare, visualizzare e cancellare note personali memorizzate su **Cloud Firestore**, mentre l'autenticazione è gestita tramite **Firebase Authentication** (login anonimo).

---

## 🚀 Funzionalità

- ✍️ Creare e cancellare note personali  
- ☁️ Archiviazione cloud persistente con **Cloud Firestore**  
- 👤 Login anonimo con **Firebase Authentication**  
- 🔒 Regole di sicurezza Firestore per dati utente-specifici  
- 🧩 Gestione dello stato con [GetX](https://pub.dev/packages/get)

---

## 📂 Struttura del progetto

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

## ⚙️ Come iniziare

### 1️⃣ Clona il repository
```bash
git clone https://github.com/matteocivitillo/flutter_notes_app_firebase.git
cd flutter_notes_app_firebase
```

### 2️⃣ Installa le dipendenze

```bash
flutter pub get
```

### 3️⃣ Collega il progetto a Firebase

Crea un progetto su [Firebase Console](https://console.firebase.google.com/) e collega la tua app Flutter seguendo la documentazione ufficiale:

📘 [Aggiungere Firebase alla tua app Flutter](https://firebase.google.com/docs/flutter/setup)

Poi esegui:

```bash
flutterfire configure
```

Questo genererà automaticamente:

```
lib/firebase_options.dart
```

> ⚠️ Non includere credenziali reali in repository pubblici. Rimuovi chiavi private o sostituiscile con “REDACTED”.

---

## 🔥 Configurazione Firebase

### Cloud Firestore

- Crea un database Firestore (per sviluppo puoi partire in **Test mode**).
- Aggiungi una collection chiamata `notes` con almeno un documento di esempio (opzionale).

### Regole di sicurezza Firestore

Per assicurare che ogni utente possa leggere/scrivere solo le proprie note, usa regole come:

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

## 🧠 Tecnologie utilizzate

| Tecnologia          | Scopo                                     |
| ------------------- | ----------------------------------------- |
| **Flutter**         | Framework UI multipiattaforma             |
| **GetX**            | State management e dependency injection   |
| **Firebase Core**   | Inizializzazione di Firebase              |
| **Cloud Firestore** | Database NoSQL cloud                       |
| **Firebase Auth**   | Autenticazione anonima degli utenti       |

---


## 🏁 Licenza

Progetto sviluppato a scopo didattico.  
© 2025 Matteo Civitillo — Tutti i diritti riservati.
