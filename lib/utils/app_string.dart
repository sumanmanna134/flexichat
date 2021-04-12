abstract class AppString{
  static const String CHAT_TITLE = "Chats";
  static const String TITLE = "Flex";
  static const String MESSAGES = "Messages";
  static const String PERSON_ONLINE = "Online";
  static const String COMMUNITY = "Community";
  static const String GROUPS = "Groups";
  static const String REQUESTS = "Requests";

  static const String PROFILE = "My Profile";
  static const String CONTACT = "My Contacts";
  static const String LOGOUT = "Logout";
  static const String SETTINGS = "Settings";
  static const String TODO = "Keep Your Tasks";
  static const String UPI_QR = "UPI QR";
  static const String FAVOURITE_CONTACTS = "Favourite Contacts";
  static const String REMOVE_FAVOURITE_CONTACTS = "Remove From Favourites";





  static List<String> dropDownList=["TEXT","PHONE"];

  static String imageFolder="Output";
  static String appDirectory="E:\\QR_CODE";


}

final List<String> tabs = [AppString.MESSAGES, AppString.PERSON_ONLINE, AppString.REQUESTS];

enum Option {
  LogIn, SignUp
}
