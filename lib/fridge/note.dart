import 'package:flutter/material.dart';
import 'package:testrun/fridge/createNote.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel noteModel;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  NoteWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber[200],
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Text(
              (noteModel.title ?? ""),
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            Text(formatter.format(noteModel.date ?? DateTime.now()))
          ],
        ),
      ),
    );
  }
}
