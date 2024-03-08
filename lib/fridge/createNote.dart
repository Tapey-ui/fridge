import 'package:flutter/material.dart';
import './fridge.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController contentController = TextEditingController();

class NoteModel {
  final String? title;
  final String? content;
  final DateTime? date;

  const NoteModel({
    this.date,
    this.title,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'date': date,
      'title': title,
      'content': content,
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  toJson() {
    return {
      "date": date,
      "title": title,
      "content": content,
    };
  }
}

void createNote(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Create Note",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 500,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  hintText: "Title",
                ),
              ),
            ),
            SizedBox(
              width: 500,
              child: TextField(
                controller: contentController,
                decoration: const InputDecoration(
                  labelText: "Content",
                  hintText: "Content",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      final now = DateTime.now();
                      final note = NoteModel(
                        date: now,
                        title: titleController.text.toString(),
                        content: contentController.text.toString(),
                      );
                      firebaseRef.add(note.toJson());
                      // firebaseRef.child(time).({
                      //   'title': titleController.text.toString(),
                      //   'content': contentController.text.toString(),
                      //   'time': time,
                      // });
                      titleController.clear();
                      contentController.clear();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Add Note")),
                ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      });
}
