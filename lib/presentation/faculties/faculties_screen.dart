import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../routes.dart';
import 'viewmodels/faculty_view_model.dart';
import '../../utils/string_extension.dart';

class FacultiesScreen extends StatefulWidget {
  FacultiesScreen({Key key}) : super(key: key);

  @override
  _FacultiesScreenState createState() => _FacultiesScreenState();
}

class _FacultiesScreenState extends State<FacultiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.5,
        automaticallyImplyLeading: false,
        title: Text(
          "Faculties",
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
        actions: [
          IconButton(
            icon: Icon(Ionicons.add_outline, color: colorPrimary),
            onPressed: () async {
              final message =
                  await Navigator.of(context).pushNamed(Routes.addFaculty);
              if (message != null) {
                showNoContextToast(successToastColor, message);
              }
            },
          ),
        ],
      ),
      body: StoreConnector<AppState, FacultyViewModel>(
        builder: (ctx, vm) {
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            itemCount: 3,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: Image.network('${vm.faculties[index].image}'),
                title: Text(
                  '${vm.faculties[index].name.toUpperCase()}',
                  style: TextStyle(
                    color: colorSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:
                    Text('${vm.faculties[index].description.capitalize()}'),
                trailing: GestureDetector(
                  onTap: () {
                    showBarModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => _buildBottomModalSheetListTile(
                            vm.faculties[index].uid));
                  },
                  child: Icon(
                    Ionicons.ellipsis_vertical_outline,
                    color: grey,
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
          );
        },
        converter: FacultyViewModel.fromStore,
        distinct: true,
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
            //   Routes.addCourse,
            //   arguments: AddCourseArgument(courseId),
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
            // Navigator.of(context).pop();
            // showLoadingDialog(context);
            // final _deleteCourseAction = DeleteCourse(courseId: courseId);
            // StoreProvider.of<AppState>(context).dispatch(_deleteCourseAction);
            // _deleteCourseAction.completer.future.then(
            //   (message) {
            //     Navigator.of(context).pop();
            //     showNoContextToast(successToastColor, message);
            //   },
            // );

            // _deleteCourseAction.completer.future.catchError((message) {
            //   Navigator.of(context).pop();
            //   showNoContextToast(errorToastColor, message);
            // });
          },
        ),
      ],
    );
  }
}
