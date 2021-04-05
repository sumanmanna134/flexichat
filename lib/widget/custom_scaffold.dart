import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget appBar;
  final Widget drawer;
  final Color backgroundColor;
  final Widget bottomNavigationBar;
  final String appBarTitle;
  final List<Widget> actions;
  const MyScaffold(
      {Key key,
        this.body,
        this.appBar,
        this.drawer,
        this.backgroundColor,
        this.bottomNavigationBar, this.appBarTitle, this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Scaffold(
      appBar: AppBar(actions: actions, title: Text(appBarTitle),),
      drawer: drawer,
      backgroundColor: backgroundColor,
      body: body,
    ));
  }
}
