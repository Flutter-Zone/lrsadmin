import "package:flutter/material.dart";
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ionicons/ionicons.dart';
import 'package:lrsadmin/constants/colors.dart';
import 'package:lrsadmin/models/menuitem.dart';
import 'package:lrsadmin/redux/app_state.dart';
import 'package:lrsadmin/routes.dart';
import 'common/drawer.dart';
import 'main_view_model.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

List<MenuItem> menuItems = [
  MenuItem(title: "Generate Reports", iconData: Ionicons.file_tray),
];

class MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StoreConnector<AppState, MainViewModel>(
        builder: (ctx, vm) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                "LRS Admin",
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              actions: [
                PopupMenuButton(
                  elevation: 3.2,
                  onSelected: (MenuItem menuItem) async {
                    // bool granted = await PermissionsService()
                    //     .requestStoragePermission(onPermissionDenied: () {
                    //   print("Permission has been denied");
                    // });
                    // if (granted) {
                    if (menuItem.title == "Generate Reports") {
                      Navigator.of(context).pushNamed(Routes.generateReport);
                    }
                    // }
                  },
                  itemBuilder: (BuildContext context) {
                    return menuItems.map((MenuItem menuItem) {
                      return PopupMenuItem(
                        value: menuItem,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          leading: Icon(
                            menuItem.iconData,
                            color: Colors.black,
                          ),
                          title: Text(
                            menuItem.title,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      );
                    }).toList();
                  },
                )
              ],
            ),
            body: _buildHomeDashboard(vm),
            drawer: DrawerBuilder(),
          );
        },
        converter: MainViewModel.fromStore,
        distinct: true,
      ),
    );
  }

  Widget _buildHomeDashboard(MainViewModel vm) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Dashboard",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 10.0),
                  height: 5.0,
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    color: colorSecondary,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: buildCardItem(
                "${vm.lecturers.length}",
                "Lecturers",
                Ionicons.people_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.lecturers),
            ),
            GestureDetector(
              child: buildCardItem(
                "${vm.courses.length}",
                "Courses",
                Ionicons.book_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.courses),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: buildCardItem(
                "${vm.faculties.length}",
                "Faculties",
                Ionicons.home_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.faculties),
            ),
            GestureDetector(
              child: buildCardItem(
                "${vm.students.length}",
                "Students",
                Ionicons.people_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.students),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: buildCardItem(
                "${vm.news.length}",
                "News",
                Ionicons.newspaper_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.news),
            ),
            GestureDetector(
              child: buildCardItem(
                "${vm.reviews.length}",
                "Reviews",
                Ionicons.chatbox_ellipses_outline,
              ),
              onTap: () => Navigator.of(context).pushNamed(Routes.reviews),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCardItem(String value, String name, IconData iconData) {
    return Container(
      height: 90.0,
      width: (MediaQuery.of(context).size.width / 2.0) - 12.0,
      child: Card(
        color: white,
        elevation: 5.0,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 40,
                  color: colorPrimary,
                ),
                VerticalDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value,
                      style: TextStyle(fontSize: 18.0, color: colorSecondary),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: colorSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
