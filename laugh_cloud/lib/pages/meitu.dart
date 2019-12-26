//美图页面
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'meituLook.dart';
import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'package:share/share.dart';
import 'login.dart';

class MeituScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MeituScreenState();
  }
}

class _MeituScreenState extends State<MeituScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  ScrollController _controller = new ScrollController();
  var _items = new List<String>();
  var _mPage = 1;
  @override
  void initState() {
    super.initState();
    getData();
    //给_controller添加监听
    _controller.addListener((){
      //判断是否滑动到了页面的最底部
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        //如果不是最后一页数据，则生成新的数据添加到list里面
        if(_mPage < 4){
          _retrieveData();
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '美图',
      home: new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          actions: <Widget> [
            GestureDetector(child: Icon(Icons.share),onTap: () {
              Share.share('【笑云安卓版】\n https://github.com/a85115695/flutter');
            },)
          ],
          title: Text('美图',style: TextStyle(color: Colors.black),),
          leading: new IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()))
            },
          ),
        ),
        body: new RefreshIndicator(
            onRefresh: _onRefresh,
            child: Container(
              padding: EdgeInsets.fromLTRB(32, 28, 32, 8),
              child: GridView.builder(
                controller: _controller,
                shrinkWrap: true, //解决 listview 嵌套报错
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 10.0,
                    //横轴间距
                    crossAxisSpacing: 10.0,
                    //子组件宽高长度比例
                    childAspectRatio: 0.6),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _jumpToGallery(context, index, _items);
                    },
                    child: Image.network(
                      _items[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                itemCount: _items.length,
              ),
            ),
        ),
      ),
    );
  }

  //预览图片
  _jumpToGallery(context,index, _items) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PhotpGalleryPage(index: index,photoList: _items)));
  }

  void getData() async {
    //初始数据源
    var url = 'https://api.apiopen.top/getImages';
    FormData formData = FormData.fromMap({
      "page": _mPage.toString(),
      "count": 10
    });
    Response response;
    var dio = new Dio();
    response = await dio.post(url, data: formData);
    for (int i=0;i<response.data['result'].length;i++){
      _items.insert(_items.length, "${response.data['result'][i]['img']}");
    }
    setState(() {
      _items;
    });
  }

  void _retrieveData() async {
    //上拉加载新的数据
    _mPage++;
    var url = 'https://api.apiopen.top/getImages';
    FormData formData = FormData.fromMap({
      "page": _mPage.toString(),
      "count": 10
    });
    Response response;
    var dio = new Dio();
    response = await dio.post(url, data: formData);
    Future.delayed(Duration(seconds: 1)).then((e){
      for (int i=0;i<response.data['result'].length;i++){
        _items.insert(_items.length, "${response.data['result'][i]['img']}");
      }
      setState(() {
        _items;
      });
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(seconds: 2)).then((e){
      showGeneralDialog(
        context: context,
        barrierLabel: "暂无更多",
        barrierDismissible: true,
        transitionDuration: Duration(milliseconds: 1000), //这个是时间
        barrierColor: Colors.black.withOpacity(0.5), // 添加这个属性是颜色
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Material(
              child: Container(
                color: Colors.black.withOpacity(animation.value),
                child: Text('暂无更多'),
              ),
            ),
          );
        },
      );
    });
  }

  @override
  void dispose() {
    //移除监听，防止内存泄漏
    _controller.dispose();
    super.dispose();
  }
}