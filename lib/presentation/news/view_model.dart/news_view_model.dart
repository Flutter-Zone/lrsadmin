library news_view_model;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/news.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'news_view_model.g.dart';

abstract class NewsViewModel
    implements Built<NewsViewModel, NewsViewModelBuilder> {
  // fields go here
  BuiltList<News> get news;
  NewsViewModel._();

  factory NewsViewModel([updates(NewsViewModelBuilder b)]) = _$NewsViewModel;

  static NewsViewModel fromStore(Store<AppState> store) {
    return NewsViewModel((n) => n..news = ListBuilder(store.state.news));
  }
}
