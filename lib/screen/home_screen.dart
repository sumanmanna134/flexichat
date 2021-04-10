import 'package:flexi_chat/main.dart';
import 'package:flexi_chat/model/message_model.dart';
import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flexi_chat/widget/category_selector.dart';
import 'package:flexi_chat/widget/custom_drawer.dart';
import 'package:flexi_chat/widget/fancy_fab_button.dart';
import 'package:flexi_chat/widget/favorite_contacts.dart';
import 'package:flexi_chat/widget/recent_chats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: CustomDrawer() ,
      ),
      backgroundColor: AppColor.colorPrimary,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), iconSize: 30.0,color: Colors.white, onPressed: (){
         _scaffoldKey.currentState.openDrawer();
        },),
        title: Observer(
          builder: (_) => Text(
            tabsStore.tabIndex == 0?AppString.CHAT_TITLE: tabsStore.getTabName(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0
            ),
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed:(){} , color: Colors.white,)
        ],
      ),
      floatingActionButton: FancyFab(),

    body: Column(
        children: [
          CategorySelector(),
          Expanded(child:
          Container(
            decoration: BoxDecoration(color:Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0) , topRight:Radius.circular(30.0) )),
            child: Observer(
              builder: (_) {
                return Column(
                  children: [
                    userStore.getFavouriteContacts.isNotEmpty?FavoriteContacts():SizedBox.shrink(),
                    RecentChats()
                  ],
                );
              }
            ),
          ))

        ],
      ),
    );
  }
}
