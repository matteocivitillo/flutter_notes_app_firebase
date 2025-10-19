import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'controllers/note_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/login_screen.dart';
import 'screens/note_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.lazyPut<UserController>(() => UserController(), fenix: true);
  Get.lazyPut<NoteController>(() => NoteController(), fenix: true);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();
    return GetMaterialApp(
      title: 'My notes',
      home: Obx(() => userController.user.value == null
          ? const LoginScreen()
          : const NoteScreen()),
    );
  }
}
