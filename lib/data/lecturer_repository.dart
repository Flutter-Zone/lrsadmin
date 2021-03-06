import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_paths.dart';
import '../models/lecturer.dart';

class LecturerRepository {
  static const UID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const PHONE = "phone";
  static const FACULTY_ID = "faculty_id";
  static const IMAGE = "image";

  final FirebaseFirestore _firebaseFirestore;

  const LecturerRepository(this._firebaseFirestore);

  Stream<Lecturer> getLecturerStream(lecturerId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_FACULTIES)
        .doc(lecturerId)
        .snapshots()
        .map((lecturerSnapshot) => fromDoc(lecturerSnapshot));
  }

  Stream<List<Lecturer>> getLecturersStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_LECTURERS)
        .snapshots()
        .map((lecturersSnapshot) {
      final lecturers = lecturersSnapshot.docs.map(fromDoc).toList();
      lecturers.sort((a, b) => a.name.compareTo(b.name));
      return lecturers;
    });
  }

  Future<void> addLecturer(email, fullname, image, phone, facultyId) async {
    CollectionReference reviews =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_LECTURERS);
    return reviews.add({
      EMAIL: email,
      NAME: fullname,
      PHONE: phone,
      IMAGE: image,
      FACULTY_ID: facultyId,
    });
  }

  Future<void> updateLecturer(
      email, fullname, image, phone, facultyId, lecturerId) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.lecturerPath(lecturerId));
    return documentReference.update({
      EMAIL: email,
      NAME: fullname,
      PHONE: phone,
      IMAGE: image,
      FACULTY_ID: facultyId,
    });
  }

  Future<void> deleteLecturer(lecturerId) {
    CollectionReference lecturers =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_LECTURERS);

    return lecturers.doc(lecturerId).delete();
  }

  static Lecturer fromDoc(DocumentSnapshot document) {
    return Lecturer((r) => r
      ..uid = document.id
      ..name = document[NAME]
      ..email = document[EMAIL]
      ..phone = document[PHONE]
      ..facultyId = document[FACULTY_ID]
      ..image = document[IMAGE]);
  }
}
