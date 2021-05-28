import 'package:firebase_core/firebase_core.dart';
import 'package:lrsadmin/data/file_repository.dart';
import 'package:lrsadmin/redux/attachment/image_processor.dart';

import '../../data/news_repository.dart';
import '../../redux/news/news_actions.dart';
import 'package:redux/redux.dart';

import '../app_state.dart';

List<Middleware<AppState>> createNewsMiddleware(
  NewsRepository newsRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return [
    TypedMiddleware<AppState, UpdateNewsUsers>(
        _updateNewsUsers(newsRepository)),
    TypedMiddleware<AppState, AddNews>(
        _addNews(newsRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, UpdateNews>(
        _updateNews(newsRepository, repository, imageProcessor)),
    TypedMiddleware<AppState, DeleteNews>(_deleteNews(newsRepository)),
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

void Function(
  Store<AppState> store,
  AddNews action,
  NextDispatcher next,
) _addNews(
  NewsRepository newsRepository,
  FileRepository repository,
  ImageProcessor imageProcessor,
) {
  return (store, action, next) async {
    next(action);
    try {
      final file = await imageProcessor.cropAndResizeAvatar(action.file);
      final url = await repository.uploadFile(file);

      await newsRepository.addNews(action.title, action.subtitle,
          action.description, url, action.createdAt);
      action.completer.complete("News added successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to add news");
    } catch (error) {
      print("An error occurred: $error");
      action.completer.completeError("Oops! Failed to add news");
    }
  };
}

void Function(
  Store<AppState> store,
  UpdateNews action,
  NextDispatcher next,
) _updateNews(
  NewsRepository newsRepository,
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
      await newsRepository.updateNews(action.title, action.subtitle,
          action.description, url, action.newsId);
      action.completer.complete("News updated successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to update news");
    } catch (error) {
      action.completer.completeError("Oops! Failed to update news");
    }
  };
}

void Function(
  Store<AppState> store,
  DeleteNews action,
  NextDispatcher next,
) _deleteNews(
  NewsRepository newsRepository,
) {
  return (store, action, next) async {
    next(action);
    try {
      await newsRepository.deleteNews(action.newsId);

      action.completer.complete("News deleted successfully!");
    } on FirebaseException {
      action.completer.completeError("Oops! Failed to delete news");
    } catch (error) {
      print('something happened: $error');
      action.completer.completeError("Oops! Failed to delete news");
    }
  };
}
