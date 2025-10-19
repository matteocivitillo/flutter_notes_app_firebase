import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My notes')),
      body: Column(
        children: const [
          AddNoteWidget(),
          Expanded(child: NoteListWidget()),
        ],
      ),
    );
  }
}

class AddNoteWidget extends StatelessWidget {
  const AddNoteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Get.find<NoteController>();
    final textInputController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            controller: textInputController,
            decoration: const InputDecoration(
              hintText: 'Enter note',
              border: OutlineInputBorder(),
            ),
            maxLines: null,
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () {
              final text = textInputController.text.trim();
              if (text.isEmpty) return;
              noteController.addNote(text);
              textInputController.clear();
            },
            child: const Text('Add note'),
          ),
        ],
      ),
    );
  }
}

class NoteListWidget extends StatelessWidget {
  const NoteListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final noteController = Get.find<NoteController>();
    return Obx(() => ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (_, i) {
            final note = noteController.notes[i];
            return Card(
              child: ListTile(
                title: Text(note.content),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => noteController.deleteNoteById(note.id),
                ),
              ),
            );
          },
        ));
  }
}
