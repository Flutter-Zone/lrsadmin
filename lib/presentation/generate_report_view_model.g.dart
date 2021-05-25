// GENERATED CODE - DO NOT MODIFY BY HAND

part of generate_report_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GenerateReportViewModel extends GenerateReportViewModel {
  @override
  final BuiltList<User> students;
  @override
  final BuiltList<Lecturer> lecturers;
  @override
  final BuiltList<Review> reviews;
  @override
  final BuiltList<Question> questions;
  @override
  final BuiltList<Course> courses;
  @override
  final BuiltList<Comment> comments;
  @override
  final BuiltList<News> news;
  @override
  final BuiltList<User> users;

  factory _$GenerateReportViewModel(
          [void Function(GenerateReportViewModelBuilder) updates]) =>
      (new GenerateReportViewModelBuilder()..update(updates)).build();

  _$GenerateReportViewModel._(
      {this.students,
      this.lecturers,
      this.reviews,
      this.questions,
      this.courses,
      this.comments,
      this.news,
      this.users})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        students, 'GenerateReportViewModel', 'students');
    BuiltValueNullFieldError.checkNotNull(
        lecturers, 'GenerateReportViewModel', 'lecturers');
    BuiltValueNullFieldError.checkNotNull(
        reviews, 'GenerateReportViewModel', 'reviews');
    BuiltValueNullFieldError.checkNotNull(
        questions, 'GenerateReportViewModel', 'questions');
    BuiltValueNullFieldError.checkNotNull(
        courses, 'GenerateReportViewModel', 'courses');
    BuiltValueNullFieldError.checkNotNull(
        comments, 'GenerateReportViewModel', 'comments');
    BuiltValueNullFieldError.checkNotNull(
        news, 'GenerateReportViewModel', 'news');
    BuiltValueNullFieldError.checkNotNull(
        users, 'GenerateReportViewModel', 'users');
  }

  @override
  GenerateReportViewModel rebuild(
          void Function(GenerateReportViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GenerateReportViewModelBuilder toBuilder() =>
      new GenerateReportViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GenerateReportViewModel &&
        students == other.students &&
        lecturers == other.lecturers &&
        reviews == other.reviews &&
        questions == other.questions &&
        courses == other.courses &&
        comments == other.comments &&
        news == other.news &&
        users == other.users;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, students.hashCode), lecturers.hashCode),
                            reviews.hashCode),
                        questions.hashCode),
                    courses.hashCode),
                comments.hashCode),
            news.hashCode),
        users.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GenerateReportViewModel')
          ..add('students', students)
          ..add('lecturers', lecturers)
          ..add('reviews', reviews)
          ..add('questions', questions)
          ..add('courses', courses)
          ..add('comments', comments)
          ..add('news', news)
          ..add('users', users))
        .toString();
  }
}

class GenerateReportViewModelBuilder
    implements
        Builder<GenerateReportViewModel, GenerateReportViewModelBuilder> {
  _$GenerateReportViewModel _$v;

  ListBuilder<User> _students;
  ListBuilder<User> get students =>
      _$this._students ??= new ListBuilder<User>();
  set students(ListBuilder<User> students) => _$this._students = students;

  ListBuilder<Lecturer> _lecturers;
  ListBuilder<Lecturer> get lecturers =>
      _$this._lecturers ??= new ListBuilder<Lecturer>();
  set lecturers(ListBuilder<Lecturer> lecturers) =>
      _$this._lecturers = lecturers;

  ListBuilder<Review> _reviews;
  ListBuilder<Review> get reviews =>
      _$this._reviews ??= new ListBuilder<Review>();
  set reviews(ListBuilder<Review> reviews) => _$this._reviews = reviews;

  ListBuilder<Question> _questions;
  ListBuilder<Question> get questions =>
      _$this._questions ??= new ListBuilder<Question>();
  set questions(ListBuilder<Question> questions) =>
      _$this._questions = questions;

  ListBuilder<Course> _courses;
  ListBuilder<Course> get courses =>
      _$this._courses ??= new ListBuilder<Course>();
  set courses(ListBuilder<Course> courses) => _$this._courses = courses;

  ListBuilder<Comment> _comments;
  ListBuilder<Comment> get comments =>
      _$this._comments ??= new ListBuilder<Comment>();
  set comments(ListBuilder<Comment> comments) => _$this._comments = comments;

  ListBuilder<News> _news;
  ListBuilder<News> get news => _$this._news ??= new ListBuilder<News>();
  set news(ListBuilder<News> news) => _$this._news = news;

  ListBuilder<User> _users;
  ListBuilder<User> get users => _$this._users ??= new ListBuilder<User>();
  set users(ListBuilder<User> users) => _$this._users = users;

  GenerateReportViewModelBuilder();

  GenerateReportViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _students = $v.students.toBuilder();
      _lecturers = $v.lecturers.toBuilder();
      _reviews = $v.reviews.toBuilder();
      _questions = $v.questions.toBuilder();
      _courses = $v.courses.toBuilder();
      _comments = $v.comments.toBuilder();
      _news = $v.news.toBuilder();
      _users = $v.users.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GenerateReportViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GenerateReportViewModel;
  }

  @override
  void update(void Function(GenerateReportViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GenerateReportViewModel build() {
    _$GenerateReportViewModel _$result;
    try {
      _$result = _$v ??
          new _$GenerateReportViewModel._(
              students: students.build(),
              lecturers: lecturers.build(),
              reviews: reviews.build(),
              questions: questions.build(),
              courses: courses.build(),
              comments: comments.build(),
              news: news.build(),
              users: users.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'students';
        students.build();
        _$failedField = 'lecturers';
        lecturers.build();
        _$failedField = 'reviews';
        reviews.build();
        _$failedField = 'questions';
        questions.build();
        _$failedField = 'courses';
        courses.build();
        _$failedField = 'comments';
        comments.build();
        _$failedField = 'news';
        news.build();
        _$failedField = 'users';
        users.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'GenerateReportViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
