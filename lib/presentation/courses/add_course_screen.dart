import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/course.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/courses/arguments/add_course_argument.dart';
import 'package:lrsadmin/presentation/courses/viewmodels/courses_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/course/course_actions.dart';
import '../../constants/colors.dart';
import '../../presentation/common/button.dart';
import '../../presentation/lecturers/viewmodels/add_lecturer_view_model.dart';
import '../../redux/app_state.dart';

class AddCourseScreen extends StatefulWidget {
  @override
  _AddCourseScreenState createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();

  String _title;
  String _description;
  double _creditHour;

  @override
  Widget build(BuildContext context) {
    final AddCourseArgument args = ModalRoute.of(context).settings.arguments;
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
            args != null ? "Edit Course" : "Add New Course",
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
        body: StoreConnector<AppState, CoursesViewModel>(
          builder: (context, vm) {
            Course course;
            if (args != null) {
              course = getCourse(vm.courses.toList(), args.courseId);
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: course != null ? course.title : '',
                      decoration: InputDecoration(
                        labelText: 'Course title',
                        hintText: 'Enter the course title',
                      ),
                      validator: (value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Course title is required';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _title = value.trim();
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: course != null ? course.description : '',
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter description',
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
                        _description = value.trim();
                      },
                    ),
                    TextFormField(
                      initialValue:
                          course != null ? course.creditHours.toString() : '',
                      decoration: InputDecoration(
                        labelText: 'Credit Hour',
                        hintText: 'Enter credit hour',
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Credit hour is required';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _creditHour = double.parse(value);
                      },
                    ),
                    SizedBox(height: 200),
                    CustomButton(
                      buttonText: args != null ? "Update Course" : "Add Course",
                      onPressedCallback: () => onPressedSubmit(args),
                    )
                  ],
                ),
              ),
            );
          },
          converter: CoursesViewModel.fromStore,
          distinct: true,
        ),
      ),
    );
  }

  void onPressedSubmit(AddCourseArgument args) {
    if (_formKey.currentState.validate()) {
      showLoadingDialog(context);
      _formKey.currentState.save();

      if (args != null) {
        final _updateCourseAction = UpdateCourse(
          courseId: args.courseId,
          creditHours: _creditHour,
          title: _title,
          description: _description,
        );

        StoreProvider.of<AppState>(context).dispatch(_updateCourseAction);

        _updateCourseAction.completer.future.then((message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(message);
          // showNoContextToast(successToastColor, message);
        });

        _updateCourseAction.completer.future.catchError((message) {
          Navigator.of(context).pop();
          showNoContextToast(errorToastColor, message);
        });

        return;
      }

      final _addCourseAction = AddCourse(
          title: _title, creditHours: _creditHour, description: _description);
      StoreProvider.of<AppState>(context).dispatch(_addCourseAction);

      _addCourseAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pop(message);
      });

      _addCourseAction.completer.future.catchError((message) {
        Navigator.of(context).pop();
        showNoContextToast(errorToastColor, message);
      });
    }
  }
}
