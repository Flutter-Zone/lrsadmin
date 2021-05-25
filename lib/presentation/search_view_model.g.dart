// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchViewModel extends SearchViewModel {
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<Faculty> faculties;
  @override
  final BuiltList<Review> reviews;

  factory _$SearchViewModel([void Function(SearchViewModelBuilder) updates]) =>
      (new SearchViewModelBuilder()..update(updates)).build();

  _$SearchViewModel._({this.lecturers, this.faculties, this.reviews})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lecturers, 'SearchViewModel', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(
        faculties, 'SearchViewModel', 'faculties');
    BuiltValueNullFieldError.checkNotNull(
        reviews, 'SearchViewModel', 'reviews');
  }

  @override
  SearchViewModel rebuild(void Function(SearchViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchViewModelBuilder toBuilder() =>
      new SearchViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchViewModel &&
        lecturers == other.lecturers &&
        faculties == other.faculties &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, lecturers.hashCode), faculties.hashCode), reviews.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchViewModel')
          ..add('lecturers', lecturers)
          ..add('faculties', faculties)
          ..add('reviews', reviews))
        .toString();
  }
}

class SearchViewModelBuilder
    implements Builder<SearchViewModel, SearchViewModelBuilder> {
  _$SearchViewModel _$v;

  ListBuilder<Lecturer> _lecturers;
  ListBuilder<Lecturer> get lecturers =>
      _$this._lecturers ??= new ListBuilder<Lecturer>();
  set lecturers(ListBuilder<Lecturer> lecturers) =>
      _$this._lecturers = lecturers;

  ListBuilder<Faculty> _faculties;
  ListBuilder<Faculty> get faculties =>
      _$this._faculties ??= new ListBuilder<Faculty>();
  set faculties(ListBuilder<Faculty> faculties) =>
      _$this._faculties = faculties;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  SearchViewModelBuilder();

  SearchViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lecturers = $v.lecturers.toBuilder();
      _faculties = $v.faculties.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SearchViewModel;
  }

  @override
  void update(void Function(SearchViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchViewModel build() {
    _$SearchViewModel _$result;
    try {
      _$result = _$v ??
          new _$SearchViewModel._(
              lecturers: lecturers.build(),
              faculties: faculties.build(),
              reviews: reviews.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lecturers';
        lecturers.build();
        _$failedField = 'faculties';
        faculties.build();
        _$failedField = 'reviews';
        reviews.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
