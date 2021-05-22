import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/faculty.dart';
import 'package:lrsadmin/presentation/faculties/arguments/add_faculty_argument.dart';
import 'package:lrsadmin/presentation/faculties/viewmodels/faculty_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/faculty/faculty_actions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../constants/res_values.dart';
import '../../presentation/common/button.dart';
import '../../presentation/common/dialogues.dart';
import '../../presentation/common/user_avatar.dart';
import '../../redux/app_state.dart';

class AddFacultyScreen extends StatefulWidget {
  @override
  _AddFacultyScreenState createState() => _AddFacultyScreenState();
}

const dafaultImageUrl =
    'https://firebasestorage.googleapis.com/v0/b/lrsapp-b01ff.appspot.com/o/images%2Favatar.png?alt=media&token=6bb41248-b709-4474-9042-9f2b6122b4f1';

class _AddFacultyScreenState extends State<AddFacultyScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _description;
  PickedFile _pickedFile;

  @override
  Widget build(BuildContext context) {
    final AddFacultyArgument args = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
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
            args != null ? "Edit Faculty" : "Add New Faculty",
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
        body: StoreConnector<AppState, FacultyViewModel>(
          builder: (context, vm) {
            // loadFacultyList(vm);
            Faculty faculty;
            if (args != null) {
              faculty = getFaculty(vm.faculties.toList(), args.facultyId);
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _pickedFile == null
                        ? Container(
                            height: 200,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: faculty != null
                                    ? NetworkImage(faculty.image)
                                    : AssetImage(
                                        "assets/images/placeholder.png",
                                      ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(
                            height: 200,
                            width: size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(
                                  File(_pickedFile.path),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                    SizedBox(height: 10.0),
                    TextButton(
                      onPressed: () => showBarModalBottomSheet(
                        expand: false,
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => _buildBottomModalSheetListTile(),
                      ),
                      child: Text(
                        "Choose Photo",
                        style: TextStyle(
                          color: colorPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: TextButton.styleFrom(shadowColor: colorPrimary),
                    ),
                    SizedBox(height: 30.0),
                    TextFormField(
                      initialValue: faculty != null ? faculty.name : '',
                      decoration: InputDecoration(
                        labelText: 'Faculty Name',
                        hintText: 'Enter faculty name',
                      ),
                      validator: (value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter faculty name';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _name = value.trim();
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: faculty != null ? faculty.description : '',
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
                    SizedBox(height: 100),
                    CustomButton(
                      buttonText:
                          args != null ? "Update Faculty" : "Add Faculty",
                      onPressedCallback: () => onPressedSubmit(args, faculty),
                    )
                  ],
                ),
              ),
            );
          },
          converter: FacultyViewModel.fromStore,
          distinct: true,
        ),
      ),
    );
  }

  void onPressedSubmit(AddFacultyArgument args, faculty) {
    if (_formKey.currentState.validate()) {
      if (args == null) {
        if (_pickedFile == null) {
          showNoContextToast(errorToastColor, "Please select an image");
          return;
        }
      }

      showLoadingDialog(context);
      _formKey.currentState.save();

      if (args != null) {
        final fileImage = _pickedFile != null ? File(_pickedFile.path) : null;
        final _updateFacultyAction = UpdateFaculty(
          facultyId: args.facultyId,
          description: _description,
          image: faculty.image,
          name: _name,
          file: fileImage,
        );

        StoreProvider.of<AppState>(context).dispatch(_updateFacultyAction);

        _updateFacultyAction.completer.future.then((message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(message);
        });

        _updateFacultyAction.completer.future.catchError((message) {
          Navigator.of(context).pop();
          showNoContextToast(errorToastColor, message);
        });

        return;
      }

      final _addFacultyAction = AddFaculty(
        description: _description,
        name: _name,
        file: File(_pickedFile.path),
      );

      StoreProvider.of<AppState>(context).dispatch(_addFacultyAction);

      _addFacultyAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pop(message);
      });

      _addFacultyAction.completer.future.catchError((message) {
        Navigator.of(context).pop();
        showNoContextToast(errorToastColor, message);
      });
    }
  }

  Widget _buildBottomModalSheetListTile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: Icon(Ionicons.camera_outline, color: grey),
          title: Text(
            "Take photo",
            style: subtitle1,
          ),
          onTap: () async {
            Navigator.of(context).pop();
            final imageFile =
                await ImagePicker().getImage(source: ImageSource.camera);
            setState(() {
              _pickedFile = imageFile;
            });
          },
        ),
        ListTile(
          leading: Icon(
            Ionicons.image_outline,
            color: grey,
          ),
          title: Text(
            "Select from images",
            style: subtitle1,
          ),
          onTap: () async {
            Navigator.of(context).pop();
            final imageFile =
                await ImagePicker().getImage(source: ImageSource.gallery);

            setState(() {
              _pickedFile = imageFile;
            });
          },
        ),
        ListTile(
          leading: Icon(
            Ionicons.close_outline,
            color: grey,
          ),
          title: Text(
            "Cancel",
            style: subtitle1,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
