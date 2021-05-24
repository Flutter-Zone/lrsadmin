// GENERATED CODE - DO NOT MODIFY BY HAND

part of review_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReviewViewModel extends ReviewViewModel {
  @override
  final BuiltList<Review> reviews;
  @override
  final BuiltList<User> users;
  @override
  final BuiltList<Course> courses;

  factory _$ReviewViewModel([void Function(ReviewViewModelBuilder) updates]) =>
      (new ReviewViewModelBuilder()..update(updates)).build();

  _$ReviewViewModel._({this.reviews, this.users, this.courses}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        reviews, 'ReviewViewModel', 'reviews');
    BuiltValueNullFieldError.checkNotNull(users, 'ReviewViewModel', 'users');
    BuiltValueNullFieldError.checkNotNull(
        courses, 'ReviewViewModel', 'courses');
  }

  @override
  ReviewViewModel rebuild(void Function(ReviewViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewViewModelBuilder toBuilder() =>
      new ReviewViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewViewModel &&
        reviews == other.reviews &&
        users == other.users &&
        courses == other.courses;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, reviews.hashCode), users.hashCode), courses.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReviewViewModel')
          ..add('reviews', reviews)
          ..add('users', users)
          ..add('courses', courses))
        .toString();
  }
}

class ReviewViewModelBuilder
    implements Builder<ReviewViewModel, ReviewViewModelBuilder> {
  _$ReviewViewModel _$v;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  ReviewViewModelBuilder();

  ReviewViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reviews = $v.reviews.toBuilder();
      _users = $v.users.toBuilder();
      _courses = $v.courses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewViewModel;
  }

  @override
  void update(void Function(ReviewViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReviewViewModel build() {
    _$ReviewViewModel _$result;
    try {
      _$result = _$v ??
          new _$ReviewViewModel._(
              reviews: reviews.build(),
              users: users.build(),
              courses: courses.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'reviews';
        reviews.build();
        _$failedField = 'users';
        users.build();
        _$failedField = 'courses';
        courses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReviewViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
