import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/redux/app_selectors.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../../constants/colors.dart';
import '../../constants/res_values.dart';
import '../../presentation/common/button.dart';
import '../../presentation/common/dialogues.dart';
import '../../presentation/common/user_avatar.dart';
import '../../presentation/lecturers/viewmodels/add_lecturer_view_model.dart';
import '../../redux/app_state.dart';
import '../../redux/lecturer/lecturer_action.dart';
import './arguments/add_lecturer_argument.dart';

class AddLecturerScreen extends StatefulWidget {
  @override
  _AddLecturerScreenState createState() => _AddLecturerScreenState();
}

const defaultAvatarUrl =
    'https://firebasestorage.googleapis.com/v0/b/lrsapp-b01ff.appspot.com/o/images%2Favatar.png?alt=media&token=6bb41248-b709-4474-9042-9f2b6122b4f1';

class _AddLecturerScreenState extends State<AddLecturerScreen> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  String _email;
  String _phone;
  PickedFile _pickedFile;
  String _selectedFaculty = "F3Tb7mibQa7sxuFulEfb";

  @override
  Widget build(BuildContext context) {
    final AddLecturerArgument args = ModalRoute.of(context).settings.arguments;
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
            args != null ? "Edit Lecturer" : "Add New Lecturer",
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
        body: StoreConnector<AppState, AddLecturersViewModel>(
          builder: (context, vm) {
            // loadFacultyList(vm);
            Lecturer lecturer;
            if (args != null) {
              lecturer = getLecturer(vm.lecturers.toList(), args.lecturerId);
              _selectedFaculty = lecturer.facultyId;
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    _pickedFile == null
                        ? UserAvatar(
                            imageUrl: lecturer != null
                                ? lecturer.image
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
                      initialValue: lecturer != null ? lecturer.name : '',
                      decoration: InputDecoration(
                        labelText: 'Name',
                        hintText: 'Enter lecturer\'s name',
                      ),
                      validator: (value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter lecturer\'s name';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _name = value.trim();
                      },
                    ),
                    TextFormField(
                      initialValue: lecturer != null ? lecturer.email : '',
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter lecturer\'s email'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (String value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter mail';
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
                      initialValue: lecturer != null ? lecturer.phone : '',
                      decoration: InputDecoration(
                          labelText: 'Phone',
                          hintText: 'Enter lecturer\'s phone number'),
                      keyboardType: TextInputType.phone,
                      validator: (String value) {
                        String errorMessage;
                        if (value.isEmpty) {
                          errorMessage = 'Please enter lecturer\'s phone';
                        }
                        return errorMessage;
                      },
                      onSaved: (value) {
                        _phone = value.trim();
                      },
                    ),
                    DropdownButton(
                      hint: Text('Select Faculty'),
                      items: vm.faculties
                          .map(
                            (faculty) => DropdownMenuItem<String>(
                              child: Text(
                                faculty.name.toUpperCase(),
                              ),
                              value: faculty.uid,
                            ),
                          )
                          .toList(),
                      value: _selectedFaculty,
                      onChanged: (value) {
                        setState(() {
                          _selectedFaculty = value;
                        });
                      },
                      isExpanded: true,
                    ),
                    SizedBox(height: 200),
                    CustomButton(
                      buttonText:
                          args != null ? "Update Lecturer" : "Add Lecturer",
                      onPressedCallback: () => onPressedSubmit(args, lecturer),
                    )
                  ],
                ),
              ),
            );
          },
          converter: AddLecturersViewModel.fromStore,
          distinct: true,
        ),
      ),
    );
  }

  void onPressedSubmit(AddLecturerArgument args, lecturer) {
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
        final _updateLecturer = UpdateLecturer(
          email: _email,
          phone: _phone,
          fullname: _name,
          image: lecturer.image,
          faculty: _selectedFaculty,
          file: fileImage,
          lecturerId: args.lecturerId,
        );

        StoreProvider.of<AppState>(context).dispatch(_updateLecturer);

        _updateLecturer.completer.future.then((message) {
          Navigator.of(context).pop();
          Navigator.of(context).pop(message);
          // showNoContextToast(successToastColor, message);
        });

        _updateLecturer.completer.future.catchError((message) {
          Navigator.of(context).pop();
          showNoContextToast(errorToastColor, message);
        });

        return;
      }

      final _addLecturerAction = AddLecturer(
        email: _email,
        phone: _phone,
        fullname: _name,
        faculty: _selectedFaculty,
        file: File(_pickedFile.path),
      );

      StoreProvider.of<AppState>(context).dispatch(_addLecturerAction);

      _addLecturerAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pop(message);
        // showNoContextToast(successToastColor, message);
      });

      _addLecturerAction.completer.future.catchError((message) {
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
