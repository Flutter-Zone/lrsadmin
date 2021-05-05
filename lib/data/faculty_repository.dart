import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/faculty.dart';
import 'firebase_paths.dart';

class FacultyRepository {
  static const NAME = "name";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";

  final FirebaseFirestore _firebaseFirestore;

  const FacultyRepository(this._firebaseFirestore);

  Stream<Faculty> getFacultyStream(facultyId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_FACULTIES)
        .doc(facultyId)
        .snapshots()
        .map((facultySnapshot) => fromDoc(facultySnapshot));
  }

  Stream<List<Faculty>> getFacultiesStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_FACULTIES)
        .snapshots()
        .map((facultySnapshot) {
      final faculties = facultySnapshot.docs.map(fromDoc).toList();
      faculties.sort((a, b) => a.name.compareTo(b.name));
      return faculties;
    });
  }

  static Faculty fromDoc(DocumentSnapshot document) {
    return Faculty((r) => r
      ..uid = document.id
      ..name = document[NAME]
      ..image = document[IMAGE]
      ..description = document[DESCRIPTION]);
  }
}
