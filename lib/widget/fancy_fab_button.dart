import 'package:flexi_chat/utils/AppColor.dart';
import 'package:flutter/material.dart';
class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  const FancyFab({Key key, this.onPressed, this.tooltip, this.icon}) : super(key: key);
  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>  with SingleTickerProviderStateMixin{
  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeInOut;
  double _fabHeight = 56.0;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250))..addListener(() {
      setState(() {

      });
    });
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0 ).animate(_animationController);
    _buttonColor = ColorTween(
      begin: AppColor.colorPrimary,
      end: AppColor.red,
    ).animate(CurvedAnimation(parent: _animationController, curve: Interval(0.00, 1.00, curve: Curves.linear)));
    _translateButton = Tween<double>(begin: _fabHeight, end: -14.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.0, 0.75, curve: _curve)));

    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  animate(){
    if(!isOpened){
      _animationController.forward();
    }else{
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget add(){
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        backgroundColor: AppColor.colorPrimary,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget image(){
    return Container(
      child: FloatingActionButton(
        onPressed: null,
        backgroundColor: Colors.amber[700],
        tooltip: 'Image',
        child: Icon(Icons.image),
      ),
    );
  }

  Widget inbox(){
    return Container(
      child: FloatingActionButton(
        backgroundColor: AppColor.colorPrimary,
        onPressed: null,
        tooltip: 'Inbox',
        child: Icon(Icons.inbox),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        tooltip: 'Toggle',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform(transform: Matrix4.translationValues(0.0, _translateButton.value * 3.0, 0.0), child: add(),),
        Transform(transform: Matrix4.translationValues(0.0, _translateButton.value * 2.0, 0.0), child: image(),),
        Transform(transform: Matrix4.translationValues(0.0, _translateButton.value, 0.0), child: inbox(),),
        toggle()

      ],
    );
  }
}
