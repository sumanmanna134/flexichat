import 'package:flexi_chat/Store/UserStore.dart';
import 'package:flexi_chat/model/message_model.dart';
import 'package:flexi_chat/model/user_model.dart';
import 'package:flexi_chat/screen/chatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../main.dart';
class RecentChats extends StatefulWidget {
  @override
  _RecentChatsState createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0),)),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: ListView.builder(itemCount: chats.length,
          itemBuilder:(BuildContext context, int index){
          final Message chat = chats[index];
          return Dismissible(
            key: ObjectKey(chat.sender.id),
            background:  _blockBgItem(),
            secondaryBackground:_deleteBgItem(),
            onDismissed: (DismissDirection direction){
              String action = direction == DismissDirection.startToEnd? "has been Blocked From your Contact":"'s chat deleted";
              Scaffold.of(context).showSnackBar(SnackBar(content: Text("${chat.sender.name}  $action")));
            },
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>ChatScreen(user: chat.sender , username:chat.sender.name)),
                );
              },
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                padding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(radius: 35.0, backgroundImage: AssetImage(chat.sender.imageUrl),),
                        SizedBox(width: 10.0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(chat.sender.name, style: TextStyle(color: Colors.grey, fontSize: 15.0,
                              fontWeight: FontWeight.bold,),),
                            SizedBox(height: 5.0,),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              child: Text(chat.text, style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                              ),overflow: TextOverflow.ellipsis,),
                            )

                          ],
                        ),

                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          chat.time,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        chat.unread
                            ? Container(
                          width: 40.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'NEW',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                            : Text(''),






                      ],)
                    // Observer(
                    //   builder: (_) {
                    //     return
                    //   }

                  ],
                ),
              ),
            ),
          );
          },),
      ),
    ));
  }

  Widget _deleteBgItem(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20),
      color: Colors.red,
      child: Icon(Icons.delete, color: Colors.white),
    );
  }

  Widget _blockBgItem(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20),
      color: Colors.blueGrey,
      child: Icon(Icons.block_flipped, color: Colors.white , size: 30.0,),
    );
  }
}
