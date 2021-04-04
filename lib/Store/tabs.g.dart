// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Tabs on _Tabs, Store {
  final _$tabIndexAtom = Atom(name: '_Tabs.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$onlinePersonsAtom = Atom(name: '_Tabs.onlinePersons');

  @override
  int get onlinePersons {
    _$onlinePersonsAtom.reportRead();
    return super.onlinePersons;
  }

  @override
  set onlinePersons(int value) {
    _$onlinePersonsAtom.reportWrite(value, super.onlinePersons, () {
      super.onlinePersons = value;
    });
  }

  final _$unreadMessagesAtom = Atom(name: '_Tabs.unreadMessages');

  @override
  int get unreadMessages {
    _$unreadMessagesAtom.reportRead();
    return super.unreadMessages;
  }

  @override
  set unreadMessages(int value) {
    _$unreadMessagesAtom.reportWrite(value, super.unreadMessages, () {
      super.unreadMessages = value;
    });
  }

  final _$chatRequestsAtom = Atom(name: '_Tabs.chatRequests');

  @override
  int get chatRequests {
    _$chatRequestsAtom.reportRead();
    return super.chatRequests;
  }

  @override
  set chatRequests(int value) {
    _$chatRequestsAtom.reportWrite(value, super.chatRequests, () {
      super.chatRequests = value;
    });
  }

  final _$_TabsActionController = ActionController(name: '_Tabs');

  @override
  void setTabIndex(int index) {
    final _$actionInfo =
        _$_TabsActionController.startAction(name: '_Tabs.setTabIndex');
    try {
      return super.setTabIndex(index);
    } finally {
      _$_TabsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String getTabName() {
    final _$actionInfo =
        _$_TabsActionController.startAction(name: '_Tabs.getTabName');
    try {
      return super.getTabName();
    } finally {
      _$_TabsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tabIndex: ${tabIndex},
onlinePersons: ${onlinePersons},
unreadMessages: ${unreadMessages},
chatRequests: ${chatRequests}
    ''';
  }
}
