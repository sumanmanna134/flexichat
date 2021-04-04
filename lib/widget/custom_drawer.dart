import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flutter/material.dart';
class CustomDrawer extends StatefulWidget {
  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("Abhishek Mishra"),
          accountEmail: Text("abhishekm977@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              "A",
              style: TextStyle(fontSize: 40.0),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.person), title: Text(AppString.PROFILE),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.contacts), title: Text(AppString.CONTACT),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings), title: Text(AppString.SETTINGS),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment), title: Text(AppString.TODO),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.qr_code), title: Text(AppString.UPI_QR),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.logout), title: Text(AppString.LOGOUT),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
