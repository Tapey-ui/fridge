import 'package:flutter/material.dart';
import 'package:testrun/fridge/createNote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testrun/fridge/note.dart';

final firebaseRef = FirebaseFirestore.instance.collection('notes');

// class _Fridge extends StatefulWidget {
//   const _Fridge({super.key});

//   @override
//   State<_Fridge> createState() => Fridge();
// }

class Fridge extends StatelessWidget {
  // const Fridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(218, 210, 209, 209),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                  stream: firebaseRef.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final noteMap = snapshot.data!.docs[index];
                        NoteModel noteModel = NoteModel.fromMap(
                            noteMap.data() as Map<String, dynamic>);
                        return NoteWidget(
                            noteModel:
                                noteModel); // gives null value if no title
                      },
                    );
                  }),
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
