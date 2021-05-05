import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onPressedCallback;

  CustomButton({this.buttonText, this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressedCallback,
      child: Container(
        height: 56.0,
        width: size.width,
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "$buttonText",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
