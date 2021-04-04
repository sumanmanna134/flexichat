import 'package:flexi_chat/Store/tabs.dart';
import 'package:flexi_chat/main.dart';
import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flexi_chat/utils/app_string.dart';
import 'package:flexi_chat/utils/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {

  final List<String> categories = tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
    height:80.0,
    color: AppColor.colorPrimary,
    child:
    ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: categories.length,
    itemBuilder: (BuildContext context, int index){
      return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Observer(
          builder: (_) => Wrap(
            children: [
              Text(
                categories[index],
                style: TextStyle(
                    color: index == tabsStore.tabIndex ? Colors.white : Colors.white60,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    letterSpacing: 1.2
                ),
              ),
              SizedBox(width: 5,),
              tabsStore.itemCount[index]>0?Container(
                width: 25,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0)

                ),
                child: Center(child: Text(tabsStore.itemCount[index]>20?"20+":tabsStore.itemCount[index].toString(), style: TextStyle(color: AppColor.colorPrimary, fontSize: 13), )),
              ):SizedBox.shrink()
            ],
          ),
        ),
      ),

        onTap: (){
        tabsStore.setTabIndex(index);
        },


      );
      },
    ),

    );
  }
}
