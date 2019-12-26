import 'package:flutter/material.dart';
import 'package:laugh_cloud/pages/meitu.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../component/toast.dart';

class PhotpGalleryPage extends StatefulWidget {
  final List photoList;
  final int index;
  PhotpGalleryPage({this.photoList, this.index});
  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}

class _PhotpGalleryPageState extends State<PhotpGalleryPage> {
  @override
  int currentIndex = 0;
  int initialIndex; //初始index
  int length;
  int title;
  @override
  void initState() {
    currentIndex = widget.index;
    initialIndex = widget.index;
    length = widget.photoList.length;
    title = initialIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MeituScreen()));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${title} / ${length}'),
          centerTitle: true,
        ),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollDirection: Axis.horizontal,
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: (BuildContext context, int index) {
                    return PhotoViewGalleryPageOptions(
                      imageProvider: NetworkImage(widget.photoList[index]),
                      initialScale: PhotoViewComputedScale.contained * 1,
                    );
                  },
                  itemCount: widget.photoList.length,
                  // loadingChild: widget.loadingChild,
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  pageController: PageController(initialPage: initialIndex), //点进去哪页默认就显示哪一页
                  onPageChanged: onPageChanged,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(child: Icon(Icons.save_alt,color: Colors.white,),onTap: () async {
                    var url = widget.photoList[title-1];
                    var response = await Dio().get(url, options: Options(responseType: ResponseType.bytes));
                    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
                    if(result != null) {
                      Toast.toast(context,msg: "保存图片成功！",position: ToastPostion.bottom);
                    }else {
                      Toast.toast(context,msg: "保存图片失败。",position: ToastPostion.bottom);
                    }
                  },)
                )
              ],
            )),
      ),
    );
  }
}