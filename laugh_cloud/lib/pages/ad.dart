//广告页面
import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class AdScreen extends StatefulWidget {
  @override
  _AdScreenState createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;
  int waitTime = 5;
  Timer _countTimer;
  //初始化
  @override
  void initState() { 
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 5000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => route==null);
      }
    });
    //播放动画
    _controller.forward();
    //右上角时间流动
    _timePass();
  }
  //销毁后
  @override
  void dispose() {
    _countTimer.cancel();
    _controller.dispose();
    super.dispose();
  }
  //后上角时间流动方法
  _timePass() {
    setState(() {
      const oneSec = const Duration(seconds: 1);
      var callback = (timer) => {
        setState(() {
          if(waitTime < 1) {
            _countTimer.cancel();
          }else {
            waitTime--;
          }
        })
      };
      _countTimer = Timer.periodic(oneSec, callback);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Stack(
      children: <Widget>[
        FadeTransition(
          opacity: _animation,
          child: Image.asset('images/start.jpg',fit: BoxFit.cover,),
        ),
        new Positioned(
          top: 20,
          right: 20,
          child: Container(
            child: GestureDetector(child: 
               Text('${waitTime}秒后跳转',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w200,decoration: TextDecoration.none),),
               onTap: (){
                 Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => route==null);
               },
            ),
            decoration: new BoxDecoration(
              border: Border.all(width: 1,color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
          ),
        )
      ],
    ),);
  }
}