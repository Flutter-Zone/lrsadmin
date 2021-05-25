import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/colors.dart';

import '../../routes.dart';

class PasswordResetEmailScreen extends StatefulWidget {
  const PasswordResetEmailScreen({Key key}) : super(key: key);
  @override
  PasswordResetEmailScreenState createState() =>
      PasswordResetEmailScreenState();
}

class PasswordResetEmailScreenState extends State<PasswordResetEmailScreen> {
  TextEditingController _emailTextEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailTextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    "Reset Link Sent",
                    style: TextStyle(
                      fontSize: 24.0,
                      color: black,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 140.0),
                Icon(
                  Ionicons.paper_plane_outline,
                  size: 100,
                  color: colorPrimary,
                ),
                SizedBox(height: 30.0),
                Text(
                  "Check your email",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  "We have sent a password recovery instructions to your email.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                // SizedBox(height: 60.0),
                // CustomButton(
                //   buttonText: "Open App",
                //   onPressedCallback: () => Navigator.of(context)
                //       .pushNamed(Routes.passwordResetEmail),
                // ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Didn't receive the email? Check your spam folder.",
                      style: TextStyle(
                        color: black,
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamed(Routes.forgotPassword),
                      child: Text(
                        "Try another email",
                        style: TextStyle(
                          color: colorSecondary,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        shadowColor: colorSecondary,
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
