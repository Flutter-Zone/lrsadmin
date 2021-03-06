import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_paths.dart';
import '../models/course.dart';

class CourseRepository {
  static const UID = "uid";
  static const TITLE = "title";
  static const DESCRIPTION = "description";
  static const CREDIT_HOURS = "credit_hours";

  final FirebaseFirestore _firebaseFirestore;

  const CourseRepository(this._firebaseFirestore);

  Stream<Course> getCourseStream(courseId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_COURSES)
        .doc(courseId)
        .snapshots()
        .map((courseSnapshot) => fromDoc(courseSnapshot));
  }

  Future<Course> getCourse(courseId) async {
    final firestoreResult = _firebaseFirestore
        .collection(FirestorePaths.PATH_COURSES)
        .doc(courseId)
        .snapshots()
        .map((courseSnapshot) => fromDoc(courseSnapshot));
    return await firestoreResult.first;
  }

  Stream<List<Course>> getCoursesStream() {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_COURSES)
        .snapshots()
        .map((coursesSnapshot) {
      final courses = coursesSnapshot.docs.map(fromDoc).toList();
      courses.sort((a, b) => a.title.compareTo(b.title));
      return courses;
    });
  }

  Future<void> addCourse(title, description, creditHours) async {
    CollectionReference courses =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_COURSES);
    return courses.add({
      TITLE: title,
      DESCRIPTION: description,
      CREDIT_HOURS: creditHours,
    });
  }

  Future<void> updateCourse(title, description, creditHours, courseId) async {
    final documentReference =
        _firebaseFirestore.doc(FirestorePaths.coursePath(courseId));
    return documentReference.update({
      TITLE: title,
      DESCRIPTION: description,
      CREDIT_HOURS: creditHours,
    });
  }

  Future<void> deleteCourse(courseId) {
    CollectionReference courses =
        FirebaseFirestore.instance.collection(FirestorePaths.PATH_COURSES);

    return courses.doc(courseId).delete();
  }

  static Course fromDoc(DocumentSnapshot document) {
    return Course(
      (r) => r
        ..uid = document.id
        ..title = document[TITLE]
        ..description = document[DESCRIPTION]
        ..creditHours = double.parse('${document[CREDIT_HOURS]}'),
    );
  }
}
