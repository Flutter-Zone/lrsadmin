import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/res_values.dart';

class NotFound extends StatelessWidget {
  final String info;
  final IconData icon;
  final Widget child;
  const NotFound({Key key, this.info, this.icon, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: size.height,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.0,
                  ),
                  child: Icon(
                    icon,
                    size: 100,
                    color: grey,
                  ),
                )
              : Container(),
          Text(
            "$info",
            style: body1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0),
          child ?? Container()
        ],
      ),
    );
  }
}
