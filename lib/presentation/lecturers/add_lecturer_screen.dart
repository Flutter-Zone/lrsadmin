import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/presentation/common/user_avatar.dart';
import 'package:lrsadmin/presentation/lecturers/viewmodels/add_lecturer_view_model.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/lecturer/lecturer_action.dart';

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
  String _selectedFaculty = "8dYBbBMoFZu8bO5tL21T";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Lecturer"),
      ),
      body: StoreConnector<AppState, AddLecturersViewModel>(
        builder: (context, vm) {
          // loadFacultyList(vm);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  UserAvatar(
                    imageUrl: defaultAvatarUrl,
                    onPressedCallback: () {},
                    size: 100,
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Name', hintText: 'Enter lecturer\'s name'),
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
                    decoration: InputDecoration(
                        labelText: 'Phone',
                        hintText: 'Enter lecturer\'s phone number'),
                    keyboardType: TextInputType.emailAddress,
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
                    hint: Text('Select Gender'),
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
                  Spacer(),
                  CustomButton(
                    buttonText: "Add Lecturer",
                    onPressedCallback: onPressedSubmit,
                  )
                ],
              ),
            ),
          );
        },
        converter: AddLecturersViewModel.fromStore,
        distinct: true,
      ),
    );
  }

  void onPressedSubmit() {
    if (_formKey.currentState.validate()) {
      showLoadingDialog(context);
      _formKey.currentState.save();

      final _addLecturerAction = AddLecturer(
        email: _email,
        phone: _phone,
        fullname: _name,
        image: defaultAvatarUrl,
        faculty: _selectedFaculty,
      );

      StoreProvider.of<AppState>(context).dispatch(_addLecturerAction);

      _addLecturerAction.completer.future.then((message) {
        Navigator.of(context).pop();
        showNoContextToast(successToastColor, message);
      });

      _addLecturerAction.completer.future.catchError((message) {
        Navigator.of(context).pop();
        showNoContextToast(errorToastColor, message);
      });
    }
  }
}
