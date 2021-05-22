import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/common/custom_text_form_field.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';

import '../../redux/auth/auth_actions.dart';
import '../../redux/app_state.dart';
import '../../routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mediumMargin = SizedBox(height: 10.0);
  var largeMargin = SizedBox(height: 30.0);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailTextEditingController = TextEditingController();
  final _passwordTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(child: _buildScaffoldBody()),
    );
  }

  Widget _buildScaffoldBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(bottom: 60.0, top: 40.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/lrs_logo.JPG",
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(60.0),
            ),
          ),
          _buildFormColumn()
        ],
      ),
    );
  }

  Widget _buildFormColumn() {
    final submitCallback = () {
      if (_formKey.currentState.validate()) {
        final loginAction = LogIn(
          email: _emailTextEditingController.text.trim(),
          password: _passwordTextEditingController.text.trim(),
        );

        StoreProvider.of<AppState>(context).dispatch(loginAction);
        showLoadingDialog(context);

        loginAction.completer.future.catchError(
          (error) {
            Navigator.of(context).pop();
            showErrorAlertDialog(context, error["title"], error["message"]);
          },
        );
      }
    };
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            "Admin | Login",
            style: TextStyle(
              fontSize: 32.0,
            ),
          ),
          largeMargin,
          CustomTextFormField(
            label: "Email",
            hintext: "example@regent.edu.gh",
            validator: (String value) {
              String errMsg;
              if (value.isEmpty) {
                errMsg = "Enter your email";
              }
              return errMsg;
            },
            textEditingController: _emailTextEditingController,
          ),
          mediumMargin,
          CustomTextFormField(
            textEditingController: _passwordTextEditingController,
            label: "Password",
            hintext: "********",
            isPasswordTextForm: true,
            validator: (String value) {
              String errMsg;
              if (value.isEmpty) {
                errMsg = "Enter your password";
              }
              return errMsg;
            },
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.forgotPassword),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: colorSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              style: TextButton.styleFrom(
                shadowColor: colorSecondary,
              ),
            ),
          ),
          mediumMargin,
          CustomButton(
            buttonText: "Login",
            onPressedCallback: submitCallback,
          ),
          // SizedBox(
          //   height: 60.0,
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       "Don't have any account?",
          //       style: TextStyle(
          //         color: grey,
          //         fontSize: 16.0,
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () =>
          //           Navigator.of(context).pushReplacementNamed(Routes.register),
          //       child: Text(
          //         "Sign Up",
          //         style: TextStyle(
          //           color: colorSecondary,
          //           fontSize: 16,
          //           fontWeight: FontWeight.normal,
          //         ),
          //       ),
          //       style: TextButton.styleFrom(
          //         shadowColor: colorSecondary,
          //       ),
          //     )
          //   ],
          // ),
        ],
      ),
    );
  }
}
