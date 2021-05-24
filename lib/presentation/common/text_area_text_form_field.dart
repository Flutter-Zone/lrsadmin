import 'package:flutter/material.dart';
import 'package:lrsadmin/constants/colors.dart';

class TextArea extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function(String value) validator;
  final Function(String value) onSaved;

  const TextArea(
      {Key key, this.textEditingController, this.validator, this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: 'Enter your comment here.',
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
      validator: validator,
      onSaved: onSaved,
    );
  }
}
