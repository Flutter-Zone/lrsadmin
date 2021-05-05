// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AppState extends AppState {
  @override
  final User user;
  @override
  final BuiltList<Faculty> faculties;
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<LecturerCourse> lecturerCourses;
  @override
  final BuiltList<Course> courses;
  @override
  final BuiltList<Review> reviews;
  @override
  final BuiltList<User> users;
  @override
  final BuiltList<News> news;
  @override
  final BuiltList<Comment> comments;
  @override
  final BuiltList<Question> questions;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.user,
      this.faculties,
      this.lecturers,
      this.lecturerCourses,
      this.courses,
      this.reviews,
      this.users,
      this.news,
      this.comments,
      this.questions})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(faculties, 'AppState', 'faculties');
    BuiltValueNullFieldError.checkNotNull(lecturers, 'AppState', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(
        lecturerCourses, 'AppState', 'lecturerCourses');
    BuiltValueNullFieldError.checkNotNull(courses, 'AppState', 'courses');
    BuiltValueNullFieldError.checkNotNull(reviews, 'AppState', 'reviews');
    BuiltValueNullFieldError.checkNotNull(users, 'AppState', 'users');
    BuiltValueNullFieldError.checkNotNull(news, 'AppState', 'news');
    BuiltValueNullFieldError.checkNotNull(comments, 'AppState', 'comments');
    BuiltValueNullFieldError.checkNotNull(questions, 'AppState', 'questions');
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        user == other.user &&
        faculties == other.faculties &&
        lecturers == other.lecturers &&
        lecturerCourses == other.lecturerCourses &&
        courses == other.courses &&
        reviews == other.reviews &&
        users == other.users &&
        news == other.news &&
        comments == other.comments &&
        questions == other.questions;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, user.hashCode),
                                        faculties.hashCode),
                                    lecturers.hashCode),
                                lecturerCourses.hashCode),
                            courses.hashCode),
                        reviews.hashCode),
                    users.hashCode),
                news.hashCode),
            comments.hashCode),
        questions.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('user', user)
          ..add('faculties', faculties)
          ..add('lecturers', lecturers)
          ..add('lecturerCourses', lecturerCourses)
          ..add('courses', courses)
          ..add('reviews', reviews)
          ..add('users', users)
          ..add('news', news)
          ..add('comments', comments)
          ..add('questions', questions))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  ListBuilder<Faculty> _faculties;
  ListBuilder<Faculty> get faculties =>
      _$this._faculties ??= new ListBuilder<Faculty>();
  set faculties(ListBuilder<Faculty> faculties) =>
      _$this._faculties = faculties;

  ListBuilder<Lecturer> _lecturers;
  ListBuilder<Lecturer> get lecturers =>
      _$this._lecturers ??= new ListBuilder<Lecturer>();
  set lecturers(ListBuilder<Lecturer> lecturers) =>
      _$this._lecturers = lecturers;

  ListBuilder<LecturerCourse> _lecturerCourses;
  ListBuilder<LecturerCourse> get lecturerCourses =>
      _$this._lecturerCourses ??= new ListBuilder<LecturerCourse>();
  set lecturerCourses(ListBuilder<LecturerCourse> lecturerCourses) =>
      _$this._lecturerCourses = lecturerCourses;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  ListBuilder<News> _news;
  ListBuilder<News> get news => _$this._news ??= new ListBuilder<News>();
  set news(ListBuilder<News> news) => _$this._news = news;

  ListBuilder<Comment> _comments;
  ListBuilder<Comment> get comments =>
      _$this._comments ??= new ListBuilder<Comment>();
  set comments(ListBuilder<Comment> comments) => _$this._comments = comments;

  ListBuilder<Question> _questions;
  ListBuilder<Question> get questions =>
      _$this._questions ??= new ListBuilder<Question>();
  set questions(ListBuilder<Question> questions) =>
      _$this._questions = questions;

  AppStateBuilder();

  AppStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user?.toBuilder();
      _faculties = $v.faculties.toBuilder();
      _lecturers = $v.lecturers.toBuilder();
      _lecturerCourses = $v.lecturerCourses.toBuilder();
      _courses = $v.courses.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _users = $v.users.toBuilder();
      _news = $v.news.toBuilder();
      _comments = $v.comments.toBuilder();
      _questions = $v.questions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AppState;
  }

  @override
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              user: _user?.build(),
              faculties: faculties.build(),
              lecturers: lecturers.build(),
              lecturerCourses: lecturerCourses.build(),
              courses: courses.build(),
              reviews: reviews.build(),
              users: users.build(),
              news: news.build(),
              comments: comments.build(),
              questions: questions.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
        _$failedField = 'faculties';
        faculties.build();
        _$failedField = 'lecturers';
        lecturers.build();
        _$failedField = 'lecturerCourses';
        lecturerCourses.build();
        _$failedField = 'courses';
        courses.build();
        _$failedField = 'reviews';
        reviews.build();
        _$failedField = 'users';
        users.build();
        _$failedField = 'news';
        news.build();
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'questions';
        questions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
