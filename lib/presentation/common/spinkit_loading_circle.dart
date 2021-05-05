import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../constants/colors.dart';

class SpinkitLoadingCircle extends StatelessWidget {
  const SpinkitLoadingCircle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFadingCircle(
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
}
