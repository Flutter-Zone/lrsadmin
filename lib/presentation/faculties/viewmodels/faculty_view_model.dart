library faculty_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/faculty.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'faculty_view_model.g.dart';

abstract class FacultyViewModel
    implements Built<FacultyViewModel, FacultyViewModelBuilder> {
  // fields go here
  BuiltList<Faculty> get faculties;

  FacultyViewModel._();

  factory FacultyViewModel([updates(FacultyViewModelBuilder b)]) =
      _$FacultyViewModel;

  static FacultyViewModel fromStore(Store<AppState> store) {
    return FacultyViewModel(
        (f) => f..faculties = ListBuilder(store.state.faculties));
  }
}
