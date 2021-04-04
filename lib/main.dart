import 'package:flexi_chat/Store/tabs.dart';
import 'package:flexi_chat/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/home_screen.dart';
final tabsStore = Tabs();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Chat',
      theme: AppTheme(),
      home: HomeScreen()
    );
  }
}
