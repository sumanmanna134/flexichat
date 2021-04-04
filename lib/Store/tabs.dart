import 'package:flexi_chat/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'tabs.g.dart';

class Tabs = _Tabs with _$Tabs;
abstract class _Tabs with Store{
  @observable
  int tabIndex=0;

  @observable
  int onlinePersons = 20;

  @observable
  int unreadMessages = 4;

  @observable
  int chatRequests = 3;


  @action
  void setTabIndex(int index){
    this.tabIndex = index;
  }
  
  @action
  String getTabName() {
    return tabs[tabIndex];
  }

  List<int> get itemCount =>[unreadMessages, onlinePersons, chatRequests];
}