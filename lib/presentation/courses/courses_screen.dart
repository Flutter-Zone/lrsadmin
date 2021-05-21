import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/course/course_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import './viewmodels/courses_view_model.dart';
import '../../utils/string_extension.dart';

class CoursesScreen extends StatefulWidget {
  CoursesScreen({Key key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Courses",
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
                  showBarModalBottomSheet(
                      expand: false,
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => _buildBottomModalSheetListTile(
                          vm.courses[index].uid));
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

  Widget _buildBottomModalSheetListTile(String courseId) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text('Edit'),
          leading: Icon(Icons.edit),
          onTap: () async {
            // Navigator.of(context).pop();
            // final message = await Navigator.of(context).pushNamed(
            //   Routes.addLecturer,
            //   arguments: AddLecturerArgument(lecturerId),
            // );
            // if (message != null) {
            //   showNoContextToast(successToastColor, message);
            // }
          },
        ),
        ListTile(
          title: Text('Delete'),
          leading: Icon(Ionicons.trash_outline),
          onTap: () {
            Navigator.of(context).pop();
            showLoadingDialog(context);
            final _deleteCourseAction = DeleteCourse(courseId: courseId);
            StoreProvider.of<AppState>(context).dispatch(_deleteCourseAction);
            _deleteCourseAction.completer.future.then(
              (message) {
                Navigator.of(context).pop();
                showNoContextToast(successToastColor, message);
              },
            );

            _deleteCourseAction.completer.future.catchError((message) {
              Navigator.of(context).pop();
              showNoContextToast(errorToastColor, message);
            });
          },
        ),
      ],
    );
  }
}
