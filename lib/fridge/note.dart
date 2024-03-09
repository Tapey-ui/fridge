import 'package:flutter/material.dart';
import 'package:testrun/fridge/createNote.dart';
import 'package:intl/intl.dart';

class NoteWidget extends StatelessWidget {
  final NoteModel noteModel;
  final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  NoteWidget({
    Key? key,
    required this.noteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => showNote(context),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.amber[200],
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            children: [
              Text(
                (noteModel.title ?? ""),
                style: const TextStyle(fontSize: 20, color: Colors.black87),
              ),
              Text(formatter.format(noteModel.date!.toDate()))
            ],
          ),
        ),
      ),
    );
  }

  void showNote(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      formatter.format(noteModel.date!.toDate()),
                      style: const TextStyle(
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      noteModel.title ?? "",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: Text(
                      noteModel.content ?? "",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Close")),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        });
  }
}
