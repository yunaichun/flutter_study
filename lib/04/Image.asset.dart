import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {

  // 如果想配置项目资源文件，就需要使用pubspec.yaml文件，需要把资源文件在这里声明。
  // 比如在项目根目录下新建了一个images文件夹，文件夹下面放了一个图片，图片的名称叫做 test.jpg，
  // 那我们在pubspec.yaml文件里就要写如下代码进行声明。
  // assets:
  //   - images/blogtouxiang.jpg

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image.asset',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image.asset'),
        ),
        body: Container(
          child: Image.asset(
            'images/test.jpeg'
          ),
        ),
      ),
    );
  }
}