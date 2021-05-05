import "package:flutter/material.dart";
import 'package:ionicons/ionicons.dart';
import 'common/drawer.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  bool isfetchingAll = true;
  bool _showChartsDashboard = false;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: _buildNotificationButton(),
            ),
          ],
        ),
        body: _showChartsDashboard
            ? _buildChartsDashboard()
            : _buildHomeDashboard(),
        drawer: DrawerBuilder(),
      ),
    );
  }

  Widget _buildNotificationButton() {
    return Container(
      width: 30.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            // top: 13.0,
            child: Icon(
              Ionicons.notifications_outline,
              color: Theme.of(context).primaryColor,
              size: 30.0,
            ),
          ),
          Positioned(
            // top: 15.0,
            left: 15.0,
            child: Container(
              height: 12.0,
              width: 12.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Center(
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: 8.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsDashboard() {
    return Container(
      color: Colors.red,
    );
  }

  Widget _buildHomeDashboard() {
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
                    color: Theme.of(context).accentColor,
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
                "1",
                "Items",
                Ionicons.accessibility,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: buildCardItem(
                "2",
                "Customers",
                Ionicons.accessibility,
              ),
              onTap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: buildCardItem(
                "1",
                "Stores",
                Ionicons.accessibility,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: buildCardItem(
                "2",
                "Users",
                Ionicons.accessibility,
              ),
              onTap: () {},
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: buildCardItem(
                "1",
                "Categories",
                Ionicons.accessibility,
              ),
              onTap: () {},
            ),
            GestureDetector(
              child: buildCardItem(
                "0",
                "Orders",
                Ionicons.accessibility,
              ),
              onTap: () {},
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
        color: Colors.white,
        elevation: 5.0,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Icon(
                  iconData,
                  size: 40,
                  color: Theme.of(context).accentColor,
                ),
                VerticalDivider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      value,
                      style: TextStyle(
                          fontSize: 18.0, color: Theme.of(context).accentColor),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Theme.of(context).primaryColor,
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
