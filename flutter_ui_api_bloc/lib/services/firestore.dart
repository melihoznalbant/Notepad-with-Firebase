import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference notes =
      FirebaseFirestore.instance.collection("notes");
  // Create
  Future<void> addNote(String note) {
    return notes.add({
      "note": note,
      "timestamp": Timestamp.now(),
    });
  }

  //Read
  Stream<QuerySnapshot> getNotesStream() {
    final notesStream =
        notes.orderBy("timestamp", descending: true).snapshots();

    return notesStream;
  }

  //Update
  Future<void> updateNote(String docID, String newNote) {
    return notes.doc(docID).update(
      {
        "note": newNote,
        "timestamp": Timestamp.now(),
      },
    );
  }
  //Delete

  Future<void> deleteNote (String docID) {
    return notes.doc(docID).delete();
  }
}
