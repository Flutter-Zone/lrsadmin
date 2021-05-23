import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/student/arguments/add_student_argument.dart';
import 'package:lrsadmin/presentation/student/viewmodels/student_view_model.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:lrsadmin/redux/student/student_action.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../constants/res_values.dart';
import '../../presentation/common/button.dart';
import '../../presentation/common/dialogues.dart';
import '../../presentation/common/user_avatar.dart';
import '../../redux/app_state.dart';

class AddStudentScreen extends StatefulWidget {
  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

const defaultAvatarUrl =
    'https://firebasestorage.googleapis.com/v0/b/lrsapp-b01ff.appspot.com/o/images%2Favatar.png?alt=media&token=6bb41248-b709-4474-9042-9f2b6122b4f1';

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscured = true;
  String _name;
  String _email;
  String _phone;
  String _password;
  PickedFile _pickedFile;

  @override
  Widget build(BuildContext context) {
    final AddStudentArgument args = ModalRoute.of(context).settings.arguments;
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
            args != null ? "Edit Student" : "Add New Student",
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
        body: StoreConnector<AppState, StudentsViewModel>(
          builder: (context, vm) {
            User student;
            if (args != null) {
              student = getUser(vm.users.toList(), args.studentId);
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _pickedFile == null
                        ? UserAvatar(
                            imageUrl: student != null
                                ? student.image
                                : defaultAvatarUrl,
                            onPressedCallback: () {},
                            size: 100,
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
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
                      initialValue: student != null ? student.name : '',
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter student name',
                      ),
                      validator: (value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter student name';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _name = value.trim();
                      },
                    ),
                    TextFormField(
                      initialValue: student != null ? student.email : '',
                      decoration: InputDecoration(
                          labelText: 'Email', hintText: 'Enter student email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter student mail';
                        }
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          errorMessage = 'Enter a valid email';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _email = value.trim();
                      },
                    ),
                    TextFormField(
                      initialValue: student != null ? student.phone : '',
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Enter student phone number'),
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter student phone';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _phone = value.trim();
                      },
                    ),
                    args == null
                        ? TextFormField(
                            initialValue: student != null ? student.phone : '',
                            decoration: InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter default password',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isObscured ? Ionicons.eye : Ionicons.eye_off,
                                  color: colorPrimary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscured = !_isObscured;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.text,
                            validator: (String value) {
                              String errorMessage;
                              if (value.isEmpty) {
                                errorMessage = 'Please enter default password';
                              }
                              return errorMessage;
                            },
                            onSaved: (value) {
                              _password = value.trim();
                            },
                            obscureText: _isObscured,
                          )
                        : Container(),
                    SizedBox(height: 200),
                    CustomButton(
                      buttonText:
                          args != null ? "Update Student" : "Add Student",
                      onPressedCallback: () => onPressedSubmit(args, student),
                    )
                  ],
                ),
              ),
            );
          },
          converter: StudentsViewModel.fromStore,
          distinct: true,
        ),
      ),
    );
  }

  void onPressedSubmit(AddStudentArgument args, student) {
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
        final _updateStudentAction = UpdateStudent(
          email: _email,
          phone: _phone,
          name: _name,
          image: student.image,
          file: fileImage,
          studentId: args.studentId,
        );

        StoreProvider.of<AppState>(context).dispatch(_updateStudentAction);

        _updateStudentAction.completer.future.then((message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(message);
          // showNoContextToast(successToastColor, message);
        });

        _updateStudentAction.completer.future.catchError((message) {
          Navigator.of(context).pop();
          showNoContextToast(errorToastColor, message);
        });

        return;
      }

      final _addStudentAction = AddStudent(
        email: _email,
        phone: _phone,
        name: _name,
        file: File(_pickedFile.path),
        password: _password,
      );

      StoreProvider.of<AppState>(context).dispatch(_addStudentAction);

      _addStudentAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pop(message);
      });

      _addStudentAction.completer.future.catchError((message) {
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
