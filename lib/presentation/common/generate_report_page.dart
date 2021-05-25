import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/models/lecturer.dart';
import 'package:lrsadmin/models/user.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:open_file/open_file.dart';
import '../../utils/string_extension.dart';
import '../generate_report_view_model.dart';
import 'generate_report_pdf.dart';

class GenerateReportPage extends StatefulWidget {
  @override
  GenerateReportPageState createState() => GenerateReportPageState();
}

List<String> dropMenutItems = [
  "Reviews",
  "Lecturer",
  "Student",
];

var dateFormat = DateFormat("y-MM-dd");

class GenerateReportPageState extends State<GenerateReportPage> {
  int _formatValue = 0;
  int _timelineValue = 0;
  int _dataFormat = 0;

  String startDate = "";
  String endDate = "";
  String studentId = "";
  String lecturerId = "";

  AutoCompleteTextField _studentSearchTextField;
  GlobalKey<AutoCompleteTextFieldState<User>> _studentSearchTextFieldKey =
      GlobalKey();

  AutoCompleteTextField _lecturerSearchTextField;
  GlobalKey<AutoCompleteTextFieldState<Lecturer>> _lecturerSearchTextFieldKey =
      GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey();

  String _selectedGenerateReportOn = dropMenutItems[0];

  var today = DateTime.now();

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDteController = TextEditingController();

  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _startDateController.text =
        dateFormat.format(DateTime(today.year, today.month, today.day));
    _endDteController.text =
        dateFormat.format(DateTime(today.year, today.month, today.day));
  }

  void _handleFormatValueChange(int value) {
    setState(() {
      _formatValue = value;
    });
  }

  void _handleDataFormatValueChange(int value) {
    setState(() {
      _dataFormat = value;
    });
  }

  void _handleTimelineValueChange(int value) {
    setState(
      () {
        _timelineValue = value;
        if (value == 0) {
          _startDateController.text =
              dateFormat.format(DateTime(today.year, today.month, today.day));
          _endDteController.text =
              dateFormat.format(DateTime(today.year, today.month, today.day));
        } else if (value == 1) {
          _startDateController.text = dateFormat
              .format(DateTime(today.year, today.month, today.day - 7));
          _endDteController.text =
              dateFormat.format(DateTime(today.year, today.month, today.day));
        } else if (value == 2) {
          _startDateController.text = dateFormat
              .format(DateTime(today.year, today.month - 1, today.day));
          _endDteController.text =
              dateFormat.format(DateTime(today.year, today.month, today.day));
        }
      },
    );
  }

  final format = DateFormat("yyyy-MM-dd");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, GenerateReportViewModel>(
        builder: (ctx, vm) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.5,
              title: Text(
                "Generate Report",
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
            ),
            bottomNavigationBar: CustomButton(
              buttonText: "Generate report",
              onPressedCallback: () {
                onSubmit(vm);
                _showLoadingProgress();
              },
            ),
            body: ListView(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Select the start and end date to generate report",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        _buildTimelineFormat(),
                        Text(
                          "Date Picker:",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        _buildStartDateField(),
                        _buildEndDateField(),
                        SizedBox(
                          height: 16.0,
                        ),
                        // _buildGenerateReportOn(),
                        _buildDropdownWidget(),
                        _selectedGenerateReportOn == "Student"
                            ? _buildStudentSearchTextField(vm)
                            : _selectedGenerateReportOn == "Lecturer"
                                ? _buildLecturerSearchTextField(vm)
                                : Offstage(),
                        SizedBox(
                          height: 16.0,
                        ),
                        _selectedGenerateReportOn == "Sales" ||
                                _selectedGenerateReportOn == "Lecturer"
                            ? _buildDataFormat()
                            : Offstage(),
                        _buildReportFormat(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        distinct: true,
        converter: GenerateReportViewModel.fromStore,
      ),
    );
  }

  void onSubmit(vm) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      String generateOnValue = "";

      if (_selectedGenerateReportOn == "Student") {
        generateOnValue = studentId;
      } else if (_selectedGenerateReportOn == "Lecturer") {
        generateOnValue = lecturerId;
      }

      Map<String, dynamic> formData = {
        "startDate": startDate,
        "endDate": endDate,
        "generateOn": _selectedGenerateReportOn,
        "generateOnValue": generateOnValue,
        "dataFormat": _dataFormat,
      };

      if (_formatValue == 0) {
        generateReportPDF(context, vm, formData).then((path) {
          Navigator.of(context).pop();
          OpenFile.open(path, type: "application/pdf");
        });
      } else if (_formatValue == 1) {
        // generateReportExcel(context, model, formData).then((path) {
        //   Navigator.of(context).pop();
        //   OpenFile.open(path,
        //       type:
        //           "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        // });
        print("Will generate excel");
      }
    }
  }

  Future<void> _showLoadingProgress() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 10.0,
              ),
              Text("Generating report..."),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStartDateField() {
    return DateTimeField(
      decoration: InputDecoration(hintText: "Start Date"),
      format: format,
      controller: _startDateController,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      validator: (DateTime date) {
        if (date.toString().isEmpty) {
          return "The start date is required";
        }
        return null;
      },
      onSaved: (DateTime date) {
        // startDate = dateFormat.format(date);
        if (date != null) {
          startDate = dateFormat.format(date);
        } else {
          startDate = _startDateController.text;
        }
      },
    );
  }

  Widget _buildEndDateField() {
    return DateTimeField(
      decoration: InputDecoration(hintText: "End Date"),
      format: format,
      controller: _endDteController,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      validator: (DateTime date) {
        if (date.toString().isEmpty) {
          return "The end date is required";
        }
        return null;
      },
      onSaved: (DateTime date) {
        // endDate = dateFormat.format(date);
        if (date != null) {
          endDate = dateFormat.format(date);
        } else {
          endDate = _endDteController.text;
        }
      },
    );
  }

  Widget _buildStudentSearchTextField(GenerateReportViewModel vm) {
    _studentSearchTextField = AutoCompleteTextField<User>(
      key: _studentSearchTextFieldKey,
      clearOnSubmit: false,
      suggestions: vm.students.toList(),
      decoration: InputDecoration(
        hintText: "Student Name",
      ),
      itemFilter: (User user, query) {
        return user.name.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (User a, User b) {
        return a.name.compareTo(b.name);
      },
      itemSubmitted: (User user) {
        setState(() {
          studentId = user.uid;
          _studentSearchTextField.textField.controller.text =
              user.name.capitalize();
        });
      },
      itemBuilder: (context, User user) {
        return ListTile(
          title: Text(user.name),
        );
      },
    );
    return _studentSearchTextField;
  }

  Widget _buildLecturerSearchTextField(GenerateReportViewModel vm) {
    _lecturerSearchTextField = AutoCompleteTextField<Lecturer>(
      key: _lecturerSearchTextFieldKey,
      clearOnSubmit: false,
      suggestions: vm.lecturers.toList(),
      decoration: InputDecoration(
        hintText: "Lecturer Name",
      ),
      itemFilter: (Lecturer lecturer, query) {
        return lecturer.name.toLowerCase().startsWith(query.toLowerCase());
      },
      itemSorter: (Lecturer a, Lecturer b) {
        return a.name.compareTo(b.name);
      },
      itemSubmitted: (Lecturer lecturer) {
        setState(() {
          lecturerId = lecturer.uid;
          _lecturerSearchTextField.textField.controller.text =
              lecturer.name.capitalize();
        });
      },
      itemBuilder: (context, Lecturer lecturer) {
        return ListTile(
          title: Text(lecturer.name),
        );
      },
    );
    return _lecturerSearchTextField;
  }

  // Widget _buildLecturerSearchTextField() {
  //   _lecturerSearchTextField = AutoCompleteTextField<Lecturer>(
  //     key: _lecturerSearchTextFieldKey,
  //     clearOnSubmit: false,
  //     suggestions: model.Lecturers,
  //     decoration: InputDecoration(
  //       hintText: "Lecturer Title",
  //     ),
  //     itemFilter: (Lecturer Lecturer, query) {
  //       return Lecturer.title.toLowerCase().startsWith(query.toLowerCase());
  //     },
  //     itemSorter: (Lecturer a, Lecturer b) {
  //       return a.title.compareTo(b.title);
  //     },
  //     itemSubmitted: (Lecturer Lecturer) {
  //       setState(() {
  //         LecturerId = Lecturer.id;
  //         _lecturerSearchTextField.textField.controller.text =
  //             HelperFunctions.capitalizeString(Lecturer.title);
  //       });
  //     },
  //     itemBuilder: (context, Lecturer Lecturer) {
  //       return LecturerCard(
  //         // User: User,
  //         Lecturer: Lecturer,
  //       );
  //     },
  //   );
  //   return _lecturerSearchTextField;
  // }

  Widget _buildReportFormat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Report Format:",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              height: 15.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _formatValue,
                    onChanged: _handleFormatValueChange,
                  ),
                  Text(
                    'PDF',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 16.0,
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 15.0),
            //   height: 15.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Radio(
            //         value: 1,
            //         groupValue: _formatValue,
            //         onChanged: _handleFormatValueChange,
            //       ),
            //       Text(
            //         'EXCEL',
            //         style: TextStyle(fontSize: 16.0),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineFormat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Date Intervals:",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _timelineValue,
                    onChanged: _handleTimelineValueChange,
                  ),
                  Text(
                    'Today',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 1,
                    groupValue: _timelineValue,
                    onChanged: _handleTimelineValueChange,
                  ),
                  Text(
                    'Weekly',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16.0,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: _timelineValue,
                    onChanged: _handleTimelineValueChange,
                  ),
                  Text(
                    'Monthly',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDataFormat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Data Format:",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15.0),
              height: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _dataFormat,
                    onChanged: _handleDataFormatValueChange,
                  ),
                  Text(
                    'Raw Data',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 16.0,
            // ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 15.0),
            //   height: 20.0,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: <Widget>[
            //       Radio(
            //         value: 1,
            //         groupValue: _dataFormat,
            //         onChanged: _handleDataFormatValueChange,
            //       ),
            //       Text(
            //         'Compressed Data',
            //         style: TextStyle(fontSize: 16.0),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdownWidget() {
    return DropdownButton(
      hint: new Text('Select Category'),
      items: dropMenutItems.map((String menuItem) {
        return DropdownMenuItem<String>(
          child: Text(menuItem.capitalize()),
          value: menuItem.capitalize(),
        );
      }).toList(),
      value: _selectedGenerateReportOn,
      onChanged: (String value) {
        setState(() {
          _selectedGenerateReportOn = value;
        });
      },
      isExpanded: true,
    );
  }
}
