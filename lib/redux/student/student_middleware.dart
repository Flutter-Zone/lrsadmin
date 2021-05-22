import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/file_repository.dart';
import 'package:lrsadmin/data/user_repository.dart';
import 'package:lrsadmin/redux/attachment/image_processor.dart';
import 'package:lrsadmin/redux/student/student_action.dart';
import 'package:redux/redux.dart';
import '../app_state.dart';

List<Middleware<AppState>> createStudentMiddleware(
  UserRepository userRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return [
    TypedMiddleware<AppState, AddStudent>(
        _addStudent(userRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, UpdateStudent>(
        _updateStudent(userRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, DeleteStudent>(_deleteStudent(userRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddStudent action,
  NextDispatcher next,
) _addStudent(
  UserRepository userRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return (store, action, next) async {
    next(action);

    try {
      final file = await imageProcessor.cropAndResizeAvatar(action.file);
      final url = await repository.uploadFile(file);

      await userRepository.addStudent(
        action.email,
        action.name,
        url,
        action.phone,
      );

      action.completer.complete("Student added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add student");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add student");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateStudent action,
  NextDispatcher next,
) _updateStudent(
  UserRepository userRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return (store, action, next) async {
    next(action);
    try {
      String url = action.image;

      if (action.file != null) {
        final file = await imageProcessor.cropAndResizeAvatar(action.file);
        url = await repository.uploadFile(file);
      }

      await userRepository.updateStudent(
        action.email,
        action.name,
        url,
        action.phone,
        action.studentId,
      );

      action.completer.complete("Student updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update student");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update student");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteStudent action,
  NextDispatcher next,
) _deleteStudent(
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await userRepository.deleteStudent(action.studentId);
      action.completer.complete("Student deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete student");
    } catch (error) {
      action.completer.completeError("Oops! Failed to delete student");
    }
  };
}
