import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flexi_chat/utils/captureAndSavePng.dart';
import 'package:flexi_chat/utils/images.dart';
import 'package:flexi_chat/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QRHomePage extends StatefulWidget {
  @override
  _QRHomePageState createState() => _QRHomePageState();
}

class _QRHomePageState extends State<QRHomePage> {
  String qrType = AppString.dropDownList.first;
  TextEditingController textEditingController = TextEditingController();
  String textToConvert = "navoki.com";
  GlobalKey imageCaptureKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if(kIsWeb){
      return MyScaffold(appBarTitle: "QR Code Generate", actions: [IconButton(icon: Icon(Icons.file_download), onPressed: (){})],
        body: Row(
          children: [
            Expanded(flex: 1 ,child: Card(elevation: 5,
              child: Padding(padding: EdgeInsets.all(20.0),child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton(
                    items: AppString.dropDownList.map((item) {
                      return DropdownMenuItem(child: Text(item), value: item,);

                    }).toList(),
                    value:qrType,
                    isExpanded: true,
                    onChanged: (data){

                      setState(() {
                        qrType = data;
                      });


                    },


                  ),

                  Container(
                    height: 150,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26)),
                      child: TextField(
                        controller: textEditingController,
                        maxLines: 5,
                        decoration:
                        InputDecoration(border: InputBorder.none),
                      )),
                  SizedBox(height: 10,),
                  RaisedButton(
                      color: AppColor.colorPrimary,
                      child: Text("GENERATE", style: TextStyle(color: Colors.white),),
                      onPressed: (){
                        setState(() {
                          if(qrType == AppString.dropDownList[1]){
                            textToConvert = "tel:${textEditingController.text}";
                            print(textToConvert);
                          }else{
                            textToConvert = "${textEditingController.text}";
                            print(textToConvert);
                          }
                        });


                  }),

                ],
              ),),)),
            Expanded(
                flex: 1,
                child:Card(
                  elevation: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 10,),
                      RepaintBoundary(
                        key:imageCaptureKey,
                        child: Container(
                          color: Colors.white,
                          child:QrImage(
                            foregroundColor: Colors.green,
                            data: textToConvert,
                            embeddedImage: AssetImage(Images.appIcon ,),
                            embeddedImageStyle: QrEmbeddedImageStyle(
                              size: Size(30, 30),
                            ),
                            version: QrVersions.auto,
                            size: 200,

                          ) ,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("${AppString.appDirectory}\\${AppString.imageFolder}", style: TextStyle(fontSize: 10),),

                      ),
                      SizedBox(height: 10,),

                      RaisedButton(onPressed: (){
                        captureAndSavePng();
                      },color: Colors.green,
                        child: Text(
                          "SAVE",
                          style: TextStyle(color: Colors.white),
                        ),),
                      SizedBox(height: 10,),
                    ],
                  ),
                ))
          ],
        ) ,);
    }else{
      return Container(child: Text(""),);
    }

  }

  void captureAndSavePng() async{
    try {
      RenderRepaintBoundary boundary = imageCaptureKey?.currentContext?.findRenderObject();
      var image = await boundary?.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      String filename = "${DateTime.now().millisecondsSinceEpoch}.png";
      String filePath =
          "${AppString.appDirectory}\\${AppString.imageFolder}\\$filename";
      File file = new File(filePath);
      file.create(recursive: true);
      await file.writeAsBytes(pngBytes);

    }catch(e){
      print(e);
    }
  }
}
