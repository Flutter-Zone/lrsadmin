import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/lecturer/lecturer_action.dart';

import '../routes.dart';
import '../utils/string_extension.dart';
import 'assign_course_to_lecturer_argument.dart';
import 'courses/viewmodels/courses_view_model.dart';

class AssignCoursesToLecturerScreen extends StatefulWidget {
  AssignCoursesToLecturerScreen({Key key}) : super(key: key);

  @override
  _AssignCoursesToLecturerScreenState createState() =>
      _AssignCoursesToLecturerScreenState();
}

class _AssignCoursesToLecturerScreenState
    extends State<AssignCoursesToLecturerScreen> {
  @override
  Widget build(BuildContext context) {
    final AssignCourseToLecturerArgument args =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Assign Courses",
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
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "${vm.courses[index].title.capitalize()}",
                  style: TextStyle(
                    color: colorSecondary,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "${vm.courses[index].description.capitalize()}",
                  style: TextStyle(fontSize: 16.0),
                ),
                trailing: Text(
                  "${vm.courses[index].creditHours}hr",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: colorPrimary,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  showLoadingDialog(context);
                  final addLectureCourseAction = AddLecturerCourse(
                    time: "8:30AM",
                    day: "Monday",
                    courseId: vm.courses[index].uid,
                    lecturerId: args.lecturerId,
                  );
                  StoreProvider.of<AppState>(context)
                      .dispatch(addLectureCourseAction);
                  addLectureCourseAction.completer.future.then((message) {
                    Navigator.of(context).pop();
                    showNoContextToast(successToastColor, message);
                  });
                  addLectureCourseAction.completer.future.catchError((message) {
                    Navigator.of(context).pop();
                    showNoContextToast(successToastColor, message);
                  });
                },
              );
            },
            itemCount: vm.courses.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
          );
        },
        distinct: true,
        converter: CoursesViewModel.fromStore,
      ),
    );
  }
}
