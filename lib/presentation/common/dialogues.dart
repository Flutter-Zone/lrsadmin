import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/constants/res_values.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: colorPrimary,
          ),
        );
      },
    ),
  );
}

void showErrorAlertDialog(BuildContext context, String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => new AlertDialog(
      title: new Text(
        '$title',
        style: TextStyle(
          color: red,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        '$message',
        style: subtitle1,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: red,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    ),
  );
}

void showNoContextToast(Color backgroundColor, String message) {
  Fluttertoast.showToast(
    msg: message,
    gravity: ToastGravity.CENTER,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: backgroundColor,
    fontSize: 16.0,
  );
}

void showToast(
    {Color backgroundColor, FToast fToast, IconData icon, String message}) {
  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: backgroundColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: white),
        SizedBox(
          width: 12.0,
        ),
        Text(
          "$message",
          style: TextStyle(color: white, fontSize: 16),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.CENTER,
    toastDuration: Duration(seconds: 2),
  );
}

void showEditCommentDialog(
    {BuildContext context, Widget content, Function onUpdateCallback}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => new AlertDialog(
      title: new Text(
        'Edit your comment',
        style: TextStyle(
          color: black,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: content,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop();
          },
          child: Text(
            'CLOSE',
            style: TextStyle(
              color: red,
              fontSize: 18.0,
            ),
          ),
        ),
        TextButton(
          onPressed: onUpdateCallback,
          child: Text(
            'UPDATE',
            style: TextStyle(
              color: colorPrimary,
              fontSize: 18.0,
            ),
          ),
        ),
      ],
    ),
  );
}
