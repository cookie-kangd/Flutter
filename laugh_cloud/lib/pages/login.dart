//登录页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'zhuce.dart';
import 'dart:convert' as convert;
import '../bottomNavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatelessWidget {
  String account;
  String password;
  //获取账号
  _getAccount(String str) {
    account = str;
  }
  //获取密码
  _getPassword(String str) {
    password = str;
  }
  //跳转注册页面
  _goZhuCe(context,index) {
    Navigator.of(context).pop();
    if(index == 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ZhuCeScreen()));
    }else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BottomNavigationWidget()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: new Text("提示"),
              content: new Text("是否退出笑云？"),
              actions: <Widget>[
                new FlatButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: new Text("确定")
                ),
                new FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: new Text("取消")
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
          Image.asset('images/wave.gif'),
          Padding(child: Image.asset('images/login.png'),padding: const EdgeInsets.only(top: 40.0),),
          Text('用户登录'),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Column(
            children: <Widget>[
            TextField(
              maxLength: 22,
              maxLines: 1,
              autofocus: false,
              decoration: InputDecoration(
                labelText: '请输入账号',
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
                icon: Icon(Icons.person)
              ),
              onChanged: _getAccount
            ),
            TextField(
              obscureText: true,
              maxLength: 22,
              maxLines: 1,
              autofocus: false,
              decoration: InputDecoration(
                labelText: '请输入密码',
                contentPadding: const EdgeInsets.all(10),
                border: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
                icon: Icon(Icons.contacts)
              ),
              onChanged: _getPassword
            ),
            Center(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(child: RaisedButton(
                  child: Text('确定'),
                  color: Colors.lightBlue,
                  onPressed: () async {
                    var url = 'https://api.apiopen.top/developerLogin';
                    FormData formData = FormData.fromMap({
                      "name": account,
                      "passwd": password
                    });
                    Response response;
                    var dio = new Dio();
                    response = await dio.post(url, data:formData);
                    if(response.data['code'] != 200) {
                      //弹出弹框
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: new Text("提示"),
                            content: new Text("${response.data['message']}"),
                            actions: <Widget>[
                              new FlatButton(
                                  onPressed: () => _goZhuCe(context,1),
                                  child: new Text("去注册")
                              ),
                              new FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: new Text("再试试")
                              ),
                            ],
                          );
                        },
                      );
                    }else {
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setString('account', account);
                      //弹出弹框
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: new Text("提示"),
                            content: new Text("登录成功！"),
                            actions: <Widget>[
                              new FlatButton(
                                  onPressed: () => _goZhuCe(context,2),
                                  child: new Text("确定")
                              )
                            ],
                          );
                        },
                      );
                    }
                  },
                ),padding: const EdgeInsets.only(right: 15.0),),
                Padding(child: RaisedButton(
                  child: Text('注册'),
                  color: Colors.lightBlue,
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> ZhuCeScreen())
                    );
                  },
                ),padding: const EdgeInsets.only(left: 15.0),),
            ],),)
          ],),)
        ],),
      ),
    );
  }
}