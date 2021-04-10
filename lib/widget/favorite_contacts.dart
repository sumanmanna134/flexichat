import 'package:flexi_chat/Store/UserStore.dart';
import 'package:flexi_chat/main.dart';
import 'package:flexi_chat/model/message_model.dart';
import 'package:flexi_chat/screen/chatScreen.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flexi_chat/utils/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../main.dart';
class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Observer(
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(userStore.onLongPress?AppString.REMOVE_FAVOURITE_CONTACTS:AppString.FAVOURITE_CONTACTS, style: TextStyle(color: Colors.blueGrey, fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 1.0), ),
                  userStore.onLongPress ? IconButton(
                    icon: Icon(
                      Icons.remove_circle,
                    ),
                    iconSize: 30.0,
                    color: Colors.red,
                    onPressed: () {
                      userStore.users[userStore.users.indexWhere((element) => element.id == userStore.currentUserId)].isFav=false;
                      userStore.removeFav(userStore.currentUserId); userStore.onLongPress=false;},
                  )  : IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                    ),
                    iconSize: 30.0,
                    color: Colors.blueGrey,
                    onPressed: () {},
                  ),


                ],
              );
            }
          ),
        ),
        
        Container(
          height: 120.0,
          child: Observer(
            builder: (_) {
              return ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: userStore.getFavouriteContacts.length,

                  itemBuilder: (BuildContext context, int index){
                    return InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            InkWell(
                              child:Observer(
                                builder: (_) {
                                  return Container(
                          height: 75,
                          width: 75,
                          decoration: new BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: new DecorationImage(
                                  image: AssetImage(userStore.getFavouriteContacts[index].imageUrl),
                                  fit: BoxFit.cover,
                            ),
                            borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                            border: userStore.onLongPress && userStore.currentUserId==userStore.getFavouriteContacts[index].id? new Border.all(
                                  color: Colors.redAccent,
                                  width: 2.0,
                            ) : null,
                          ),
                        );
                                }
                              ),
                              onLongPress: (){
                                  print("dada");
                                  userStore.setLongPress(true);
                                  userStore.currentUserId = userStore.getFavouriteContacts[index].id;

                                  // print(userStore.getFavouriteContacts);
                              },
                              onTap: (){
                                userStore.setLongPress(false);
                                if(!userStore.onLongPress){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>ChatScreen(user:userStore.getFavouriteContacts[index] , username:userStore.getFavouriteContacts[index].name)),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 6.0,),
                            Text(
                              userStore.getFavouriteContacts[index].name, style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          ),
        )
      ],
    );
  }
}
