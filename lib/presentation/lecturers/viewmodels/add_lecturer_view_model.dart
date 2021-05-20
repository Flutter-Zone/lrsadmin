library add_lecturer_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/lecturer.dart';
import '../../../models/faculty.dart';
import 'package:redux/redux.dart';
import '../../../redux/app_state.dart';

part 'add_lecturer_view_model.g.dart';

abstract class AddLecturersViewModel
    implements Built<AddLecturersViewModel, AddLecturersViewModelBuilder> {
  BuiltList<Faculty> get faculties;
  BuiltList<Lecturer> get lecturers;

  AddLecturersViewModel._();

  factory AddLecturersViewModel([updates(AddLecturersViewModelBuilder b)]) =
      _$AddLecturersViewModel;

  static AddLecturersViewModel fromStore(Store<AppState> store) {
    return AddLecturersViewModel((l) => l
      ..faculties = ListBuilder(store.state.faculties)
      ..lecturers = ListBuilder(store.state.lecturers));
  }
}
