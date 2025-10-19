import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/note.dart';
import 'user_controller.dart';

class NoteController extends GetxController {
  final _firestore = FirebaseFirestore.instance;
  final notes = <Note>[].obs;
  late final UserController _userController;

  @override
  void onInit() async {
    super.onInit();
    _userController = Get.find<UserController>();

    // se non loggato, non caricare nulla
    if (_userController.user.value == null) return;

    final uid = _userController.user.value!.uid;
    final snapshot = await _firestore
        .collection('notes')
        .where('userId', isEqualTo: uid)
        .get();

    notes.value =
        snapshot.docs.map((d) => Note.fromFirestore(d.data(), d.id)).toList();
  }

  Future<void> addNote(String content) async {
    final uid = _userController.user.value!.uid;
    final data = Note(id: '', content: content, userId: uid).toFirestore();
    final ref = await _firestore.collection('notes').add(data);
    notes.add(Note.fromFirestore(data, ref.id));
  }

  Future<void> deleteNoteById(String id) async {
    await _firestore.collection('notes').doc(id).delete();
    notes.removeWhere((n) => n.id == id);
  }
}
