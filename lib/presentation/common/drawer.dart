import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/presentation/drawer_view_model.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/redux/auth/auth_actions.dart';
import 'package:lrsadmin/routes.dart';

import 'dialogues.dart';

class DrawerBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          StoreConnector(
            builder: (ctx, vm) {
              return vm.user != null
                  ? DrawerHeader(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 15.0),
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45.0),
                                  border: Border.all(
                                    width: 2,
                                    color: colorPrimary,
                                  ),
                                ),
                                child: Center(
                                  child: Container(
                                    height: 80.0,
                                    width: 80.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40.0),
                                      image: DecorationImage(
                                        image: NetworkImage(vm.user.image),
                                        fit: BoxFit.cover,
                                      ),
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
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Container(
                                      height: 40.0,
                                      width: 155.0,
                                      child: Text(
                                        "${vm.user.name}",
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
                            "${vm.user.email}",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container();
            },
            converter: DrawerViewModel.fromStore,
            distinct: true,
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
                  color: colorPrimary,
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
                  color: colorPrimary,
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
                  color: colorPrimary,
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
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.students);
                },
                leading: Icon(
                  Ionicons.people_outline,
                  size: 25.0,
                  color: colorPrimary,
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
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.news);
                },
                leading: Icon(
                  Ionicons.newspaper_outline,
                  size: 25.0,
                  color: colorPrimary,
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
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.reviews);
                },
                leading: Icon(
                  Ionicons.chatbox_ellipses_outline,
                  size: 25.0,
                  color: colorPrimary,
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
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.comments);
                },
                leading: Icon(
                  Ionicons.chatbubble_ellipses_outline,
                  size: 25.0,
                  color: colorPrimary,
                ),
                title: Text(
                  "News Comments",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(Routes.questions);
                },
                leading: Icon(
                  Ionicons.chatbubble_ellipses_outline,
                  size: 25.0,
                  color: colorPrimary,
                ),
                title: Text(
                  "Questions",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                onTap: () {
                  final logout = LogOutAction();
                  StoreProvider.of<AppState>(context).dispatch(logout);
                  showLoadingDialog(context);
                },
                leading: Icon(
                  Ionicons.log_out_outline,
                  size: 25.0,
                  color: red,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: red,
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
