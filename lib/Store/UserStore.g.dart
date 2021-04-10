// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<ObservableList<User>>_$getBlockedContactsComputed;

  @override
  ObservableList<User> get getBlockedContacts =>
      (_$getBlockedContactsComputed ??= Computed<ObservableList<User>>(
              () => super.getBlockedContacts,
              name: '_UserStore.getBlockedContacts'))
          .value;
  Computed<ObservableList<User>> _$getFavouriteContactsComputed;

  @override
  ObservableList<User> get getFavouriteContacts =>
      (_$getFavouriteContactsComputed ??= Computed<ObservableList<User>>(
              () => super.getFavouriteContacts,
              name: '_UserStore.getFavouriteContacts'))
          .value;

  final _$usersAtom = Atom(name: '_UserStore.users');

  @override
  ObservableList<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$onLongPressAtom = Atom(name: '_UserStore.onLongPress');

  @override
  bool get onLongPress {
    _$onLongPressAtom.reportRead();
    return super.onLongPress;
  }

  @override
  set onLongPress(bool value) {
    _$onLongPressAtom.reportWrite(value, super.onLongPress, () {
      super.onLongPress = value;
    });
  }

  final _$currentUserIdAtom = Atom(name: '_UserStore.currentUserId');

  @override
  int get currentUserId {
    _$currentUserIdAtom.reportRead();
    return super.currentUserId;
  }

  @override
  set currentUserId(int value) {
    _$currentUserIdAtom.reportWrite(value, super.currentUserId, () {
      super.currentUserId = value;
    });
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setLongPress(bool value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setLongPress');
    try {
      return super.setLongPress(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFav(int userId) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.removeFav');
    try {
      return super.removeFav(userId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeFav(int userId) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.makeFav');
    try {
      return super.makeFav(userId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBlockUnblock(int userId, bool value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setBlockUnblock');
    try {
      return super.setBlockUnblock(userId, value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
onLongPress: ${onLongPress},
currentUserId: ${currentUserId},
getBlockedContacts: ${getBlockedContacts},
getFavouriteContacts: ${getFavouriteContacts}
    ''';
  }
}
