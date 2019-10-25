import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TooltipWidget extends StatelessWidget {
  const TooltipWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip'),
      ),
      body: Center(
        child: Tooltip(
          child: Icon(Icons.all_inclusive),
          message: 'don not touch me'
        ),
      ),
    );
  }
}
