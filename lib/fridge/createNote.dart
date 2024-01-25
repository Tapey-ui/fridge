import 'package:flutter/material.dart';
import './fridge.dart';

final TextEditingController titleController = TextEditingController();
final TextEditingController contentController = TextEditingController();

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
                      final time = DateTime.now().microsecond.toString();
                      firebaseRef.child(time).set({
                        'title': titleController.text.toString(),
                        'content': contentController.text.toString(),
                        'time': time,
                      });
                      titleController.clear();
                      contentController.clear();
                    },
                    child: const Text("Add Note")),
                ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
              ],
            ),
            const SizedBox(height: 20),
          ],
        );
      });
}
