import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    FirebaseAuth.instance.authStateChanges().listen((u) => user.value = u);
  }

  Future<void> loginAnonymously() async {
    if (user.value != null) return;
    final cred = await FirebaseAuth.instance.signInAnonymously();
    user.value = cred.user;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
