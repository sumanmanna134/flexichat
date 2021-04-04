import 'package:flutter/material.dart';

double scaledWidth(BuildContext context, double widthScale){
  return MediaQuery.of(context).size.width * (widthScale/100);

}

double scaledHeight(BuildContext context , double heightScale){
  return MediaQuery.of(context).size.height * (heightScale /100);
}

double scaleMin(BuildContext context, double size){
  if(MediaQuery.of(context).size.width<MediaQuery.of(context).size.height){
    return scaledWidth(context, size);
  }else{
    return scaledHeight(context, size);
  }
}

double scaleMax(BuildContext context, double size){
  if(MediaQuery.of(context).size.width>MediaQuery.of(context).size.height){
    return scaledWidth(context, size);
  }else{
    return scaledHeight(context, size);
  }
}

