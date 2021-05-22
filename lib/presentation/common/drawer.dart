import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/routes.dart';

class DrawerBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 15.0),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Administrator",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          // userStore != null
                          //     ?
                          Container(
                            height: 40.0,
                            width: 155.0,
                            child: Text(
                              "Blankson Richmond",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "admin@wetreats.com",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.lecturers);
                },
                leading: Icon(
                  Ionicons.people_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Lecturers",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.courses);
                },
                leading: Icon(
                  Ionicons.book_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Courses",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.home_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Faculties",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.faculties);
                },
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Ionicons.people_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Students",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.newspaper_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "News",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Ionicons.chatbox_ellipses_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Reviews",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.chatbubble_ellipses_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "News Comments",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  // Navigator.of(context).pushReplacementNamed('/login_page');
                  // model.logout();
                },
                leading: Icon(
                  Ionicons.log_out_outline,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
    //   },
    // );
  }
}
