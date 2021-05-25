library search_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/faculty.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/models/review.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'search_view_model.g.dart';

abstract class SearchViewModel
    implements Built<SearchViewModel, SearchViewModelBuilder> {
  // fields go here
  BuiltList<Lecturer> get lecturers;
  BuiltList<Faculty> get faculties;
  BuiltList<Review> get reviews;

  SearchViewModel._();

  factory SearchViewModel([updates(SearchViewModelBuilder b)]) =
      _$SearchViewModel;

  static SearchViewModel fromStore(Store<AppState> store) {
    return SearchViewModel((s) => s
      ..lecturers = ListBuilder(store.state.lecturers)
      ..faculties = ListBuilder(store.state.faculties)
      ..reviews = ListBuilder(store.state.reviews));
  }
}
