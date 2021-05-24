// GENERATED CODE - DO NOT MODIFY BY HAND

part of drawer_view_model;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DrawerViewModel extends DrawerViewModel {
  @override
  final User user;

  factory _$DrawerViewModel([void Function(DrawerViewModelBuilder) updates]) =>
      (new DrawerViewModelBuilder()..update(updates)).build();

  _$DrawerViewModel._({this.user}) : super._();

  @override
  DrawerViewModel rebuild(void Function(DrawerViewModelBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DrawerViewModelBuilder toBuilder() =>
      new DrawerViewModelBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DrawerViewModel && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DrawerViewModel')..add('user', user))
        .toString();
  }
}

class DrawerViewModelBuilder
    implements Builder<DrawerViewModel, DrawerViewModelBuilder> {
  _$DrawerViewModel _$v;

  UserBuilder _user;
  UserBuilder get user => _$this._user ??= new UserBuilder();
  set user(UserBuilder user) => _$this._user = user;

  DrawerViewModelBuilder();

  DrawerViewModelBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DrawerViewModel other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DrawerViewModel;
  }

  @override
  void update(void Function(DrawerViewModelBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DrawerViewModel build() {
    _$DrawerViewModel _$result;
    try {
      _$result = _$v ?? new _$DrawerViewModel._(user: _user?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'user';
        _user?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DrawerViewModel', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
