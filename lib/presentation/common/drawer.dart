import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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
                            // image: DecorationImage(
                            //   image: AssetImage("assets/images/lunch.jpeg"),
                            //   fit: BoxFit.cover,
                            // ),
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
                            "Main Admin",
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
                              "South Africa",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          // : Offstage(),
                          SizedBox(
                            height: 5.0,
                          ),
                          // userStore != null
                          //     ?
                          Text(
                            "+27247656959",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          // : Offstage(),
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
                onTap: () {},
                leading: Icon(
                  Ionicons.people,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Items",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/orderspage");
                },
                leading: Icon(
                  Ionicons.people,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Orders",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.people,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Customers",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("/add_store_page");
                },
                leading: Icon(
                  Ionicons.settings,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Stores",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Ionicons.settings,
                  size: 25.0,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Settings",
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
