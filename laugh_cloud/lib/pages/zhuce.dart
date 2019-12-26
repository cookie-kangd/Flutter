//注册页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'login.dart';

class ZhuCeScreen extends StatelessWidget {
  String account;
  String password;
  String email;
  //获取账号
  _getAccount(String str) {
    account = str;
  }
  //获取密码
  _getPassword(String str) {
    password = str;
  }
  //获取邮箱
  _getEmail(String str) {
    email = str;
  }
  //跳转登录页面
  _goLogin(context) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
        Image.asset('images/wave.gif'),
        Padding(child: Image.asset('images/login.png'),padding: const EdgeInsets.only(top: 40.0),),
        Text('用户注册'),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
          children: <Widget>[
          TextField(
            maxLength: 22,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              labelText: '请输入注册账号',
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
              labelText: '请输入注册密码',
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
              icon: Icon(Icons.contacts)
            ),
            onChanged: _getPassword
          ),
          TextField(
            maxLength: 22,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              labelText: '请输入注册邮箱',
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
              icon: Icon(Icons.mail)
            ),
            onChanged: _getEmail
          ),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(child: RaisedButton(
                child: Text('确定'),
                color: Colors.lightBlue,
                onPressed: () async {
                  var url = 'https://api.apiopen.top/developerRegister';
                  FormData formData = FormData.fromMap({
                    "name": account,
                    "passwd": password,
                    "email": email
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
                                onPressed: () => Navigator.of(context).pop(),
                                child: new Text("留在注册")
                            ),
                            new FlatButton(
                                onPressed: () => _goLogin(context),
                                child: new Text("去登录")
                            ),
                          ],
                        );
                      },
                    );
                  }else {
                    //弹出弹框
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("提示"),
                          content: new Text("注册成功！"),
                          actions: <Widget>[
                            new FlatButton(
                                onPressed: () => _goLogin(context),
                                child: new Text("确定")
                            )
                          ],
                        );
                      },
                    );
                  }
                },
              ),padding: const EdgeInsets.only(right: 15.0),)
          ],),)
        ],),)
      ],),
    );
  }
}