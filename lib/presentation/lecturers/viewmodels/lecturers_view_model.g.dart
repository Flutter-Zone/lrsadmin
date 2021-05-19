// GENERATED CODE - DO NOT MODIFY BY HAND

part of lecturers_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LecturersViewModel extends LecturersViewModel {
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<Faculty> faculties;
  @override
  final BuiltList<Review> reviews;
  @override
  final double averageRating;

  factory _$LecturersViewModel(
          [void Function(LecturersViewModelBuilder) updates]) =>
      (new LecturersViewModelBuilder()..update(updates)).build();

  _$LecturersViewModel._(
      {this.lecturers, this.faculties, this.reviews, this.averageRating})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lecturers, 'LecturersViewModel', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(
        faculties, 'LecturersViewModel', 'faculties');
    BuiltValueNullFieldError.checkNotNull(
        reviews, 'LecturersViewModel', 'reviews');
    BuiltValueNullFieldError.checkNotNull(
        averageRating, 'LecturersViewModel', 'averageRating');
  }

  @override
  LecturersViewModel rebuild(
          void Function(LecturersViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LecturersViewModelBuilder toBuilder() =>
      new LecturersViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LecturersViewModel &&
        lecturers == other.lecturers &&
        faculties == other.faculties &&
        reviews == other.reviews &&
        averageRating == other.averageRating;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, lecturers.hashCode), faculties.hashCode),
            reviews.hashCode),
        averageRating.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LecturersViewModel')
          ..add('lecturers', lecturers)
          ..add('faculties', faculties)
          ..add('reviews', reviews)
          ..add('averageRating', averageRating))
        .toString();
  }
}

class LecturersViewModelBuilder
    implements Builder<LecturersViewModel, LecturersViewModelBuilder> {
  _$LecturersViewModel _$v;

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

  double _averageRating;
  double get averageRating => _$this._averageRating;
  set averageRating(double averageRating) =>
      _$this._averageRating = averageRating;

  LecturersViewModelBuilder();

  LecturersViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lecturers = $v.lecturers.toBuilder();
      _faculties = $v.faculties.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _averageRating = $v.averageRating;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LecturersViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LecturersViewModel;
  }

  @override
  void update(void Function(LecturersViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LecturersViewModel build() {
    _$LecturersViewModel _$result;
    try {
      _$result = _$v ??
          new _$LecturersViewModel._(
              lecturers: lecturers.build(),
              faculties: faculties.build(),
              reviews: reviews.build(),
              averageRating: BuiltValueNullFieldError.checkNotNull(
                  averageRating, 'LecturersViewModel', 'averageRating'));
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
            'LecturersViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
