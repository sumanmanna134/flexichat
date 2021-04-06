import 'package:flexi_chat/main.dart';
import 'package:flexi_chat/model/message_model.dart';
import 'package:flexi_chat/model/user_model.dart';
import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flexi_chat/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  final String username;

  ChatScreen({@required this.user, @required this.username});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
        left: 80.0,
      )
          : EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        )
            : BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked
              ? Theme.of(context).primaryColor
              : Colors.blueGrey,
          onPressed: () {},
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){},
            child: Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: 20, backgroundImage: AssetImage(widget.user.imageUrl),),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user.name,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Last seen today at 12:05",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.video_call_rounded),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_call),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),

          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
          Observer(


            builder: (context) {
              return PopupMenuButton<String>(


                onSelected: (value){

                  if(value=="makeFavourite"){
                    print(userStore.users.indexWhere((element) => element.id==widget.user.id));
                    if(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].isFav){
                      print(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].toJson());
                      userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].isFav= false;
                      userStore.removeFav(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].id);


                      _displaySnackBar(context, "${widget.username} has been removed from your favourites", Colors.red);

                    }else{
                      print(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].toJson());
                      userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].isFav= true;
                      userStore.makeFav(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].id);
                      _displaySnackBar(context,"${widget.username} has been added to your favourites" , Colors.green);


                    }
                  }

                },

                itemBuilder: (BuildContext context){
                  return[
                    PopupMenuItem(child: Icon(userStore.users[userStore.users.indexWhere((element) => element.id==widget.user.id)].isFav?Icons.favorite : Icons.favorite_border , color: Colors.red,), value: "makeFavourite",),
                    PopupMenuItem(child: Text("Block"), value: "block",),

                  ];

                },
              );
            }
          )



        ],
      ),
      body: Container(child: Text(""),)
    );
  }

  _displaySnackBar(BuildContext context , String msg , Color bgColor) {
    final snackBar = SnackBar(content: Text(msg,) , backgroundColor:bgColor,);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
}