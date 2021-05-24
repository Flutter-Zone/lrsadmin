library drawer_view_model;

import 'package:built_value/built_value.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:redux/redux.dart';

part 'drawer_view_model.g.dart';

abstract class DrawerViewModel
    implements Built<DrawerViewModel, DrawerViewModelBuilder> {
  @nullable
  User get user;

  DrawerViewModel._();

  factory DrawerViewModel([updates(DrawerViewModelBuilder b)]) =
      _$DrawerViewModel;

  static DrawerViewModel fromStore(Store<AppState> store) {
    return DrawerViewModel(
      (u) => u..user = _getUser(store),
    );
  }

  static UserBuilder _getUser(Store<AppState> store) {
    if (store.state.user != null) {
      return store.state.user.toBuilder();
    }
    return null;
  }
}
