import '../../data/news_repository.dart';
import '../../redux/news/news_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createNewsMiddleware(
  NewsRepository newsRepository,
) {
  return [
    TypedMiddleware<AppState, UpdateNewsUsers>(
        _updateNewsUsers(newsRepository)),
  ];
}

void Function(
  Store<AppState> store,
  UpdateNewsUsers action,
  NextDispatcher next,
) _updateNewsUsers(
  NewsRepository newsRepository,
) {
  return (store, action, next) async {
    next(action);
    newsRepository.updateUserList(action.newsId, action.users).then((value) {
      action.completer.complete("Updated");
    }).catchError((error) {
      action.completer.completeError(error);
    });
  };
}
