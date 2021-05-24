library questions_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/question.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'questions_view_model.g.dart';

abstract class QuestionsViewModel
    implements Built<QuestionsViewModel, QuestionsViewModelBuilder> {
  // fields go here
  BuiltList<Question> get questions;

  QuestionsViewModel._();

  factory QuestionsViewModel([updates(QuestionsViewModelBuilder b)]) =
      _$QuestionsViewModel;

  static QuestionsViewModel fromStore(Store<AppState> store) {
    return QuestionsViewModel(
        (q) => q..questions = ListBuilder(store.state.questions));
  }
}
