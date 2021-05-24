import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/question.dart';
import 'package:lrsadmin/presentation/question/arguments/add_question_argument.dart';
import 'package:lrsadmin/presentation/question/viewmodels/questions_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/question/question_actions.dart';
import '../../constants/colors.dart';
import '../../presentation/common/button.dart';
import '../../presentation/common/dialogues.dart';
import '../../redux/app_state.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final _formKey = GlobalKey<FormState>();

  String _question;

  @override
  Widget build(BuildContext context) {
    final AddQuestionArgument args = ModalRoute.of(context).settings.arguments;
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.5,
          automaticallyImplyLeading: false,
          title: Text(
            args != null ? "Edit Question" : "Add Question",
            style: TextStyle(color: black),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Ionicons.close,
              color: colorPrimary,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: StoreConnector<AppState, QuestionsViewModel>(
          builder: (context, vm) {
            // loadFacultyList(vm);
            Question question;
            if (args != null) {
              question = getQuestion(vm.questions.toList(), args.questionId);
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: question != null ? question.question : '',
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter question',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              0.0,
                            ),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorPrimary,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: colorPrimary,
                            width: 2.0,
                          ),
                        ),
                      ),
                      onSaved: (String value) {
                        _question = value.trim();
                      },
                    ),
                    SizedBox(height: 100),
                    CustomButton(
                      buttonText:
                          args != null ? "Update Question" : "Add Question",
                      onPressedCallback: () => onPressedSubmit(args, question),
                    )
                  ],
                ),
              ),
            );
          },
          converter: QuestionsViewModel.fromStore,
          distinct: true,
        ),
      ),
    );
  }

  void onPressedSubmit(AddQuestionArgument args, question) {
    if (_formKey.currentState.validate()) {
      showLoadingDialog(context);
      _formKey.currentState.save();

      if (args != null) {
        final _updateQuestionAction = UpdateQuestion(
          questionId: args.questionId,
          question: _question,
        );

        StoreProvider.of<AppState>(context).dispatch(_updateQuestionAction);

        _updateQuestionAction.completer.future.then((message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(message);
        });

        _updateQuestionAction.completer.future.catchError((message) {
          Navigator.of(context).pop();
          showNoContextToast(errorToastColor, message);
        });

        return;
      }

      final _addQuestionAction = AddQuestion(
        question: _question,
      );

      StoreProvider.of<AppState>(context).dispatch(_addQuestionAction);

      _addQuestionAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pop(message);
      });

      _addQuestionAction.completer.future.catchError((message) {
        Navigator.of(context).pop();
        showNoContextToast(errorToastColor, message);
      });
    }
  }
}
