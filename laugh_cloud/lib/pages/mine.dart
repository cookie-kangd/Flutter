//我的页面
import 'package:flutter/material.dart';
import 'package:laugh_cloud/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';
import 'login.dart';

class MineScreen extends StatefulWidget {
  @override
  _MineScreenState createState() => _MineScreenState();
}

class _MineScreenState extends State<MineScreen> {
  String account;
  //初始化
  @override
  void initState() { 
    super.initState();
    _getAccount();
  }
  //获取登录账号名称
  _getAccount() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      account = prefs.getString('account');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: <Widget> [
          GestureDetector(child: Icon(Icons.share),onTap: () {
            Share.share('【笑云安卓版】\n https://github.com/a85115695/flutter');
          },)
        ],
        leading: new IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()))
          },
        ),
      ),
      body: Center(child: Column(children: <Widget>[
        Expanded(child: Padding(padding: const EdgeInsets.only(top: 50),child: Column(children: <Widget>[
          Image.asset('images/login.png'),
          Text('${account}')
        ],),),),
        Expanded(child: Padding(child: Text('此项目是用flutter而做，是仿写了我RN做的项目笑云，两个项目都是一周不到的时间完工，包含面非常广，适合用于学习，这个项目主要是自己学习flutter的时候做的，觉得不错的小伙伴记得给个star噢。'),padding: const EdgeInsets.all(10),),),
        Expanded(child: Center(child: Column(children: <Widget>[
          RaisedButton(
            child: Text('注销'),
            color: Colors.lightBlue,
            onPressed: () async {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.report),
              Text('made by DK')
          ],)
        ],),),)
      ],),),
    );
  }
}