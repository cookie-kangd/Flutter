//视频页面
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:share/share.dart';
import 'login.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  var _itemsTitle = new List<dynamic>();
  var _itemsUrl = new List<dynamic>();
  //初始化
  @override
  void initState() { 
    super.initState();
    _getVideo();
  }
  //摧毁
  @override
  void dispose() { 
    super.dispose();
  }
  //获取视频
  _getVideo() async {
    var url = 'https://api.apiopen.top/todayVideo';
    Response response;
    var dio = new Dio();
    response = await dio.get(url);
    response.data['result'].removeAt(0);
    for(int i=0;i<response.data['result'].length;i++) {
      if(response.data['result'][i]['data']['content'] != null) {
        if(response.data['result'][i]['data']['content']['data']['playUrl'] != null) {
          _itemsTitle.insert(_itemsTitle.length, "${response.data['result'][i]['data']['content']['data']['description']}");
          _itemsUrl.insert(_itemsUrl.length, "${response.data['result'][i]['data']['content']['data']['playUrl']}");
        }
      }
    }
    for(int i2=0;i2<_itemsUrl.length;i2++) {
      _itemsUrl[i2] = 'https:'+_itemsUrl[i2].toString().split(':')[1];
    }
    setState(() {
      _itemsTitle;
      _itemsUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('视频',style: TextStyle(color: Colors.black),),
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
      body: ListView.builder(
        itemCount: _itemsUrl.length,
        itemBuilder: (context,index) {
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('${_itemsTitle[index]}',textAlign: TextAlign.center,),
                Center(
                  child: new Chewie(
                    controller: ChewieController(
                      videoPlayerController: VideoPlayerController.network('${_itemsUrl[index]}'),
                      aspectRatio: 16 / 9,
                      autoPlay: !true,
                      looping: !true,
                      showControls: true,
                      // 占位图
                      placeholder: new Container(
                          color: Colors.black54,
                      ),
                      // 是否在 UI 构建的时候就加载视频
                      autoInitialize: true,
                      // 拖动条样式颜色
                      materialProgressColors: new ChewieProgressColors(
                          playedColor: Colors.greenAccent,
                          handleColor: Colors.blue,
                          backgroundColor: Colors.grey,
                          bufferedColor: Colors.black45,
                      ),
                    ),
                  ),
              ),
                Divider(color: Colors.blue,)
            ],),
          );
        },
      ),
    );
  }
}