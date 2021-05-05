import 'package:redux/redux.dart';
import '../../data/file_repository.dart';
import '../../data/user_repository.dart';
import '../../redux/user/user_actions.dart';

import '../app_state.dart';
import 'attachment_actions.dart';
import 'image_processor.dart';

List<Middleware<AppState>> createAttachmentMiddleware(
  FileRepository fileRepository,
  ImageProcessor imageProcessor,
  UserRepository userRepository,
) {
  return [
    TypedMiddleware<AppState, ChangeAvatarAction>(_changeAvatar(
      fileRepository,
      imageProcessor,
      userRepository,
    )),
  ];
}

void Function(
  Store<AppState> store,
  ChangeAvatarAction action,
  NextDispatcher next,
) _changeAvatar(
  FileRepository repository,
  ImageProcessor imageProcessor,
  UserRepository userRepository,
) {
  return (store, action, next) async {
    next(action);
    if (store.state.user.uid != action.user.uid) {
      return;
    }
    try {
      final file = await imageProcessor.cropAndResizeAvatar(action.file);
      final url = await repository.uploadFile(file);
      final user = action.user.rebuild((u) => u..image = url);
      await userRepository.updateUser(user);
      store.dispatch(OnUserUpdateAction(user));
    } catch (error) {
      print(error.toString());
    }
  };
}
