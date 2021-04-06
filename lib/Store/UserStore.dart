import 'dart:core';
import 'dart:core';
import 'package:flexi_chat/model/message_model.dart';
import 'package:flexi_chat/model/user_model.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx/mobx.dart';
part 'UserStore.g.dart';

class UserStore = _UserStore with _$UserStore;
abstract class _UserStore with Store{

  @observable
  ObservableList<User> users = ObservableList<User>.of([sam,greg,james, john, olivia, sophia, steven]);

  @observable
  bool onLongPress = false;

  @observable
  int currentUserId=0;

  @action
  void setLongPress(bool value){
    this.onLongPress = value;
  }






  @computed
  ObservableList<User> get getBlockedContacts => ObservableList.of(users.where((user) => user.isBlocked==true));


  @computed
  ObservableList<User> get getFavouriteContacts =>
      ObservableList.of(users.where((user) => user.isFav==true));

  @action
  void removeFav(int userId){
    int index = getFavouriteContacts.indexWhere((element) => element.id==userId);
   users[index].isFav = false;
   getFavouriteContacts.removeAt(index);
  }

  @action
  void makeFav(int userId){

    users[users.indexWhere((element) => element.id == userId)].isFav = true;
    getFavouriteContacts.add(users[users.indexWhere((element) => element.id == userId)]);

  }

  @action
  void setBlockUnblock(int userId, bool value){
    int index = users.indexWhere((user) => user.id == userId);
    users[index].isBlocked = value;
  }





}