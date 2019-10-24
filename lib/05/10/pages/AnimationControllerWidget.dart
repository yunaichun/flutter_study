import 'package:flutter/material.dart';

class AnimationControllerWidget extends StatefulWidget {
  AnimationControllerWidget({Key key}) : super(key: key);

  @override
  _AnimationControllerWidgetState createState() => _AnimationControllerWidgetState();
}


// 继承 SingleTickerProviderStateMixin ，重写里面的方法
class _AnimationControllerWidgetState extends State<AnimationControllerWidget> with SingleTickerProviderStateMixin {
  // 动画控制器
  AnimationController _control;
  // 动画
  Animation _animation;

  // 重写初始化状态
  @override
  void initState() {
    super.initState();

    // 初始化动画控制
    _control = AnimationController(
      vsync: this,
      // 动画时长为 3 秒
      duration: Duration(milliseconds: 3000)
    );
    // 动画的效果
    _animation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(_control);

    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // 路由跳转同时销毁当前动画
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => route == null
        );
      }
    });

    // 播放动画
    _control.forward();
  }

  // 重写销毁方法
  @override
  void dispose() {
    super.dispose();
    // 销毁动画
    _control.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 透明度动画组件
    return FadeTransition(
      // 执行动画
      opacity: _animation,
      // 动画子元素 - 图片
      child: Image.network(
        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1546851657199&di=fdd278c2029f7826790191d59279dbbe&imgtype=0&src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F0112cb554438090000019ae93094f1.jpg%401280w_1l_2o_100sh.jpg',
        // 进行缩放
        scale: 2.0,
        // 充满父容器
        fit: BoxFit.cover,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Text('首页'),
      ),
    );
  }
}
