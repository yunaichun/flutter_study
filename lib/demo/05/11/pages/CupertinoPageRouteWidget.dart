import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPageRouteWidget extends StatelessWidget {
  const CupertinoPageRouteWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 脚手架
    return CupertinoPageScaffold(
      child: Center(
        child: Container(
          height: 100.0,
          width: 100.0,
          color: CupertinoColors.activeBlue,
          child: CupertinoButton(
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (BuildContext context) {
                    return CupertinoPageRouteWidget();
                  }
                )
              );
            },
          ),
        ),
      ),
    );
  }
}
