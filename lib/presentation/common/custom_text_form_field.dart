import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintext;
  final String label;
  final bool isPasswordTextForm;
  final bool enabled;
  final Function validator;
  final TextEditingController textEditingController;
  final bool isPhoneNumber;

  CustomTextFormField({
    this.hintext,
    this.label,
    this.isPasswordTextForm = false,
    this.enabled = true,
    this.textEditingController,
    this.validator,
    this.isPhoneNumber = false,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isInvisible = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var textStyle = TextStyle(color: Colors.grey, fontSize: 18.0);

    return Container(
      width: size.width,
      padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
      margin: EdgeInsets.only(bottom: size.height * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.black12,
            offset: Offset(0, 1.0),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${widget.label}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          TextFormField(
            controller: widget.textEditingController,
            enabled: widget.enabled,
            decoration: InputDecoration(
              hintText: widget.hintext ?? "",
              hintStyle: textStyle,
              border: InputBorder.none,
              suffixIcon: widget.isPasswordTextForm
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isInvisible = !_isInvisible;
                        });
                      },
                      icon: Icon(
                        _isInvisible
                            ? Ionicons.eye_sharp
                            : Ionicons.eye_off_sharp,
                      ),
                    )
                  : Offstage(),
            ),
            obscureText: widget.isPasswordTextForm
                ? _isInvisible
                : widget.isPasswordTextForm,
            style: textStyle,
            validator: widget.validator,
            keyboardType:
                widget.isPhoneNumber ? TextInputType.phone : TextInputType.text,
          )
        ],
      ),
    );
  }
}
