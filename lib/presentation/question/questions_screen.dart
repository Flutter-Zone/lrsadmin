import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/question/arguments/add_question_argument.dart';
import 'package:lrsadmin/presentation/question/viewmodels/questions_view_model.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/question/question_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../utils/string_extension.dart';

import '../../routes.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({Key key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBar(),
      body: _buildQuestionsListView(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      title: Text(
        "Review Questions",
        style: TextStyle(color: black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Ionicons.close_outline,
          color: colorPrimary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: Icon(Ionicons.add_outline, color: colorPrimary),
          onPressed: () async {
            final message =
                await Navigator.of(context).pushNamed(Routes.addQuestion);
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
      ],
    );
  }

  Widget _buildQuestionsListView() {
    return StoreConnector<AppState, QuestionsViewModel>(
      builder: (ctx, vm) {
        return ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text("${vm.questions[index].question.capitalize()}"),
              onTap: () async {
                showBarModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => _buildBottomModalSheetListTile(
                    vm.questions[index].uid,
                  ),
                );
              },
            );
          },
          separatorBuilder: (ctx, index) => Divider(),
          itemCount: vm.questions.length,
        );
      },
      converter: QuestionsViewModel.fromStore,
    );
  }

  Widget _buildBottomModalSheetListTile(questionId) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Edit'),
          leading: Icon(Icons.edit),
          onTap: () async {
            Navigator.of(context).pop();
            final message = await Navigator.of(context).pushNamed(
              Routes.addQuestion,
              arguments: AddQuestionArgument(questionId),
            );
            if (message != null) {
              showNoContextToast(successToastColor, message);
            }
          },
        ),
        ListTile(
          title: Text('Delete'),
          leading: Icon(Ionicons.trash_outline),
          onTap: () {
            Navigator.of(context).pop();
            showLoadingDialog(context);
            final _deleteLecturerAction =
                DeleteQuestion(questionId: questionId);
            StoreProvider.of<AppState>(context).dispatch(_deleteLecturerAction);
            _deleteLecturerAction.completer.future.then(
              (message) {
                Navigator.of(context).pop();
                showNoContextToast(successToastColor, message);
              },
            );

            _deleteLecturerAction.completer.future.catchError((message) {
              Navigator.of(context).pop();
              showNoContextToast(errorToastColor, message);
            });
          },
        ),
      ],
    );
  }
}
