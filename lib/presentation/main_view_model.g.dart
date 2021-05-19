// GENERATED CODE - DO NOT MODIFY BY HAND

part of main_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MainViewModel extends MainViewModel {
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<Course> courses;
  @override
  final BuiltList<Faculty> faculties;
  @override
  final BuiltList<User> students;
  @override
  final BuiltList<News> news;
  @override
  final BuiltList<Review> reviews;

  factory _$MainViewModel([void Function(MainViewModelBuilder) updates]) =>
      (new MainViewModelBuilder()..update(updates)).build();

  _$MainViewModel._(
      {this.lecturers,
      this.courses,
      this.faculties,
      this.students,
      this.news,
      this.reviews})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        lecturers, 'MainViewModel', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(courses, 'MainViewModel', 'courses');
    BuiltValueNullFieldError.checkNotNull(
        faculties, 'MainViewModel', 'faculties');
    BuiltValueNullFieldError.checkNotNull(
        students, 'MainViewModel', 'students');
    BuiltValueNullFieldError.checkNotNull(news, 'MainViewModel', 'news');
    BuiltValueNullFieldError.checkNotNull(reviews, 'MainViewModel', 'reviews');
  }

  @override
  MainViewModel rebuild(void Function(MainViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MainViewModelBuilder toBuilder() => new MainViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MainViewModel &&
        lecturers == other.lecturers &&
        courses == other.courses &&
        faculties == other.faculties &&
        students == other.students &&
        news == other.news &&
        reviews == other.reviews;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, lecturers.hashCode), courses.hashCode),
                    faculties.hashCode),
                students.hashCode),
            news.hashCode),
        reviews.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MainViewModel')
          ..add('lecturers', lecturers)
          ..add('courses', courses)
          ..add('faculties', faculties)
          ..add('students', students)
          ..add('news', news)
          ..add('reviews', reviews))
        .toString();
  }
}

class MainViewModelBuilder
    implements Builder<MainViewModel, MainViewModelBuilder> {
  _$MainViewModel _$v;

  ListBuilder<Lecturer> _lecturers;
  ListBuilder<Lecturer> get lecturers =>
      _$this._lecturers ??= new ListBuilder<Lecturer>();
  set lecturers(ListBuilder<Lecturer> lecturers) =>
      _$this._lecturers = lecturers;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  ListBuilder<Faculty> _faculties;
  ListBuilder<Faculty> get faculties =>
      _$this._faculties ??= new ListBuilder<Faculty>();
  set faculties(ListBuilder<Faculty> faculties) =>
      _$this._faculties = faculties;

  ListBuilder<User> _students;
  ListBuilder<User> get students =>
      _$this._students ??= new ListBuilder<User>();
  set students(ListBuilder<User> students) => _$this._students = students;

  ListBuilder<News> _news;
  ListBuilder<News> get news => _$this._news ??= new ListBuilder<News>();
  set news(ListBuilder<News> news) => _$this._news = news;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  MainViewModelBuilder();

  MainViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _lecturers = $v.lecturers.toBuilder();
      _courses = $v.courses.toBuilder();
      _faculties = $v.faculties.toBuilder();
      _students = $v.students.toBuilder();
      _news = $v.news.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MainViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MainViewModel;
  }

  @override
  void update(void Function(MainViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MainViewModel build() {
    _$MainViewModel _$result;
    try {
      _$result = _$v ??
          new _$MainViewModel._(
              lecturers: lecturers.build(),
              courses: courses.build(),
              faculties: faculties.build(),
              students: students.build(),
              news: news.build(),
              reviews: reviews.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lecturers';
        lecturers.build();
        _$failedField = 'courses';
        courses.build();
        _$failedField = 'faculties';
        faculties.build();
        _$failedField = 'students';
        students.build();
        _$failedField = 'news';
        news.build();
        _$failedField = 'reviews';
        reviews.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MainViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
