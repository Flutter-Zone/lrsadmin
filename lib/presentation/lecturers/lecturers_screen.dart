import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/presentation/common/button.dart';
import '../../constants/colors.dart';
import '../../presentation/common/not_found.dart';
import '../../presentation/common/user_avatar.dart';

class LecturersScreen extends StatefulWidget {
  LecturersScreen({Key key}) : super(key: key);

  @override
  _LecturersScreenState createState() => _LecturersScreenState();
}

class _LecturersScreenState extends State<LecturersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: _buildAppBarWidget(),
      body: _buildLecturersListView(),
    );
  }

  Widget _buildAppBarWidget() {
    String title = "Lecturers";
    return AppBar(
      backgroundColor: white,
      elevation: 0.5,
      automaticallyImplyLeading: false,
      title: Text(
        "$title",
        style: TextStyle(color: black),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Ionicons.close,
          color: colorPrimary,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildLecturersListView() {
    return 1 <= 0
        ? NotFound(
            info:
                "Sorry!, we couldn't find any lecturers on the database. Please add some lecturers",
            child: CustomButton(
              buttonText: "Add Lecturer",
              onPressedCallback: () {},
            ),
          )
        : NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowGlow();
              return;
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return _buildLecturerContainer();
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                height: 10.0,
                indent: 85.0,
              ),
            ),
          );
  }
}

Widget _buildLecturerContainer() {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(bottom: 10.0, top: 10),
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            imageUrl:
                "https://billiardport.com/assets/pages/media/profile/profile_user.jpg",
            size: 80,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  "Atta Opoku",
                  maxLines: 1,
                  minFontSize: 16,
                  maxFontSize: 16,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  "atta.opoku@regent.edu.gh",
                  maxLines: 1,
                  minFontSize: 14,
                  maxFontSize: 14,
                  style: TextStyle(
                    color: grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                AutoSizeText(
                  "FAS",
                  maxLines: 1,
                  minFontSize: 14,
                  maxFontSize: 14,
                  style: TextStyle(
                    color: colorSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.star_sharp,
                color: starColor,
              ),
              Text(
                "0.0",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Ionicons.ellipsis_vertical_outline,
              color: grey,
            ),
          )
        ],
      ),
    ),
  );
}
