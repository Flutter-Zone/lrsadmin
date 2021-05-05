import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_paths.dart';
import '../models/lecturer_course.dart';

class LecturerCourseRepository {
  static const UID = "uid";
  static const COURSE_ID = "course_id";
  static const LECTURER_ID = "lecturer_id";
  static const DAY = "day";
  static const TIME = "time";

  final FirebaseFirestore _firebaseFirestore;

  const LecturerCourseRepository(this._firebaseFirestore);

  Stream<List<LecturerCourse>> getLecturerCoursesStream(lecturerId) {
    return _firebaseFirestore
        .collection(FirestorePaths.PATH_LECTURER_COURSES)
        .where("lecturer_id", isEqualTo: lecturerId)
        .snapshots()
        .map(
      (lecturerCoursesSnapshot) {
        final lecturerCourses =
            lecturerCoursesSnapshot.docs.map(fromDoc).toList();
        return lecturerCourses;
      },
    );
  }

  static LecturerCourse fromDoc(DocumentSnapshot document) {
    return LecturerCourse(
      (r) => r
        ..uid = document.id
        ..lecturerId = document[LECTURER_ID]
        ..courseId = document[COURSE_ID]
        ..day = document[DAY]
        ..time = document[TIME],
    );
  }
}
