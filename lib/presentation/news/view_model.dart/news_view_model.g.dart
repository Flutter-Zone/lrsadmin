// GENERATED CODE - DO NOT MODIFY BY HAND

part of news_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$NewsViewModel extends NewsViewModel {
  @override
  final BuiltList<News> news;

  factory _$NewsViewModel([void Function(NewsViewModelBuilder) updates]) =>
      (new NewsViewModelBuilder()..update(updates)).build();

  _$NewsViewModel._({this.news}) : super._() {
    BuiltValueNullFieldError.checkNotNull(news, 'NewsViewModel', 'news');
  }

  @override
  NewsViewModel rebuild(void Function(NewsViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NewsViewModelBuilder toBuilder() => new NewsViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NewsViewModel && news == other.news;
  }

  @override
  int get hashCode {
    return $jf($jc(0, news.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NewsViewModel')..add('news', news))
        .toString();
  }
}

class NewsViewModelBuilder
    implements Builder<NewsViewModel, NewsViewModelBuilder> {
  _$NewsViewModel _$v;

  ListBuilder<News> _news;
  ListBuilder<News> get news => _$this._news ??= new ListBuilder<News>();
  set news(ListBuilder<News> news) => _$this._news = news;

  NewsViewModelBuilder();

  NewsViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _news = $v.news.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NewsViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NewsViewModel;
  }

  @override
  void update(void Function(NewsViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NewsViewModel build() {
    _$NewsViewModel _$result;
    try {
      _$result = _$v ?? new _$NewsViewModel._(news: news.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'news';
        news.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'NewsViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
