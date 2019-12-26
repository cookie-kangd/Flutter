//天气页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:share/share.dart';
import 'login.dart';

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  String city;
  String weather;
  String wendu;
  String fengxiang;
  String fengsu;
  var isGet = true;
  //获取天气城市
  _getCity(String str) {
    city = str;
  }
  //获取天气
  _getWeather() async {
    var url = 'https://free-api.heweather.net/s6/weather/now?location='+city+'&key=5c8f736045744c089c4c0571b4c4248b';
    Response response;
    var dio = new Dio();
    response = await dio.get(url);
    if(response.data != null) {
      setState(() {
        isGet = false;
        city = response.data['HeWeather6'][0]['basic']['location'];
        weather = response.data['HeWeather6'][0]['now']['cond_txt'];
        wendu = response.data['HeWeather6'][0]['now']['tmp'];
        fengxiang = response.data['HeWeather6'][0]['now']['wind_dir'];
        fengsu = response.data['HeWeather6'][0]['now']['wind_spd'];
      });
    }else {
      showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: new Text("提示"),
            content: new Text("抱歉,未查询到天气,请注意输入正确的城市名称噢!"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: new Text("确定")
              )
            ],
          );
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天气',style: TextStyle(color: Colors.black),),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Image.asset('images/weatherBander.jpg'),
          Padding(padding: const EdgeInsets.only(top: 30),child: TextField(
            maxLength: 8,
            maxLines: 1,
            autofocus: false,
            decoration: InputDecoration(
              labelText: '请输入查询的天气城市',
              contentPadding: const EdgeInsets.all(10),
              border: OutlineInputBorder(borderSide: BorderSide(color: Colors.lightBlue)),
              icon: Icon(Icons.cloud)
            ),
            onChanged: _getCity
          ),)
        ],),
        Offstage(
          offstage: isGet,
          child: Column(children: <Widget>[
            Text('当前选择城市：${city}'),
            Text('天气： ${weather}'),
            Text('温度： ${wendu}摄氏度'),
            Text('风向： ${fengxiang}'),
            Text('风速： ${fengsu}/每小时')
          ],),
        ),
        Center(child: Padding(padding: const EdgeInsets.only(top: 50),child: RaisedButton(
          child: Text('查询'),
          color: Colors.lightBlue,
          onPressed: _getWeather,
        ),),),
      ],),),
    );
  }
}