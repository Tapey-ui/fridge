import 'package:flutter/material.dart';
import 'package:testrun/fridge/createNote.dart';
import 'package:firebase_storage/firebase_storage.dart';

// final firebaseRef = FirebaseSt.instance.ref();

class Fridge extends StatelessWidget {
  const Fridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(218, 210, 209, 209),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () => createNote(context),
                icon: const Icon(
                  Icons.add,
                  size: 24.0,
                  color: Colors.white,
                ),
                label: const Text('Add Note',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
