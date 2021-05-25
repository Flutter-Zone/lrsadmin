import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import 'package:lrsadmin/presentation/common/custom_text_form_field.dart';
import 'package:lrsadmin/presentation/common/dialogues.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/user/user_actions.dart';
import '../../constants/colors.dart';

import '../../routes.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key key}) : super(key: key);
  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  TextEditingController _emailTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 30.0, top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Ionicons.close_outline,
                        size: 30.0,
                        color: colorPrimary,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      "Forgot Password",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: black,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Enter your registered email address below & we'll send you an email with instructions to reset your password.",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 30.0),
              Form(
                key: _formStateKey,
                child: CustomTextFormField(
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
              ),
              SizedBox(height: 60.0),
              CustomButton(
                buttonText: "Reset Password",
                onPressedCallback: _onSubmitCallback,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmitCallback() {
    if (_formStateKey.currentState.validate()) {
      showLoadingDialog(context);
      final email = _emailTextEditingController.text.trim();
      final _resetPasswordAction = ResetPassword(email: email);
      StoreProvider.of<AppState>(context).dispatch(_resetPasswordAction);

      _resetPasswordAction.completer.future.then((message) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed(Routes.passwordResetEmail);
      });

      _resetPasswordAction.completer.future.catchError((message) {
        showNoContextToast(errorToastColor, message);
      });
    }
  }
}
