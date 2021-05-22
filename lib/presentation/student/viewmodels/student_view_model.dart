library student_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:redux/redux.dart';
import '../../../redux/app_state.dart';

part 'student_view_model.g.dart';

abstract class StudentsViewModel
    implements Built<StudentsViewModel, StudentsViewModelBuilder> {
  // fields go here
  BuiltList<User> get users;

  StudentsViewModel._();

  factory StudentsViewModel([updates(StudentsViewModelBuilder b)]) =
      _$StudentsViewModel;

  static StudentsViewModel fromStore(Store<AppState> store) {
    return StudentsViewModel((l) => l..users = ListBuilder(store.state.users));
  }
}
