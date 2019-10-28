import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image'),
        ),
        body: Center(
          child: Container(
            // Image.asset:加载资源图片，就是加载项目资源目录中的图片,加入图片后会增大打包的包体体积，用的是相对路径。
            // Image.network:网络资源图片，意思就是你需要加入一段http://xxxx.xxx的这样的网络路径地址。
            // Image.file:加载本地图片，就是加载本地文件中的图片，这个是一个绝对路径，跟包体无关。
            // Image.memory: 加载Uint8List资源图片。
            child: Image.network(
              'https://avatars3.githubusercontent.com/u/15957114?s=460&v=4',
              // 缩放比例
              scale: 1.0,
              // BoxFit.fill:全图显示，图片会被拉伸，并充满父容器。[全图显示]
              // BoxFit.contain:全图显示，显示原比例，可能会有空隙。[等比例某个方向全部显示]
              // BoxFit.cover：显示可能拉伸，可能裁切，充满（图片要充满整个容器，还不变形）。
              // BoxFit.fitWidth：宽度充满（横向充满），显示可能拉伸，可能裁切。
              // BoxFit.fitHeight ：高度充满（竖向充满）,显示可能拉伸，可能裁切。
              // BoxFit.scaleDown：效果和contain差不多，但是此属性不允许显示超过源图片大小，可小不可大。
              fit: BoxFit.contain, // 如果不写的话原图显示
              // 图片添加颜色
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.darken,
              // 图片是否重复显示
              repeat: ImageRepeat.repeatX,
            ),
            width: 300.0,
            height: 200.0,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
