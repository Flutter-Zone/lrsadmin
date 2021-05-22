import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/faculty_repository.dart';
import 'package:lrsadmin/redux/faculty/faculty_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createFacultyMiddleware(
  FacultyRepository facultyRepository,
) {
  return [
    TypedMiddleware<AppState, AddFaculty>(_addFaculty(facultyRepository)),
    TypedMiddleware<AppState, UpdateFaculty>(_updateFaculty(facultyRepository)),
    TypedMiddleware<AppState, DeleteFaculty>(_deleteFaculty(facultyRepository)),
  ];
}

void Function(
  Store<AppState> store,
  AddFaculty action,
  NextDispatcher next,
) _addFaculty(
  FacultyRepository facultyRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await facultyRepository.addFaculty(
          action.name, action.description, action.image);
      action.completer.complete("Faculty added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add faculty");
    } catch (error) {
      action.completer.completeError("Oops! Failed to add faculty");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateFaculty action,
  NextDispatcher next,
) _updateFaculty(
  FacultyRepository facultyRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await facultyRepository.updateFaculty(
          action.name, action.description, action.image, action.facultyId);
      action.completer.complete("Faculty updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update faculty");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update faculty");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteFaculty action,
  NextDispatcher next,
) _deleteFaculty(
  FacultyRepository facultyRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await facultyRepository.deleteFaculty(action.facultyId);

      action.completer.complete("Faculty deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete faculty");
    } catch (error) {
      print('something happened: $error');
      action.completer.completeError("Oops! Failed to delete faculty");
    }
  };
}
