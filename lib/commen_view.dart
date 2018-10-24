import 'package:flutter/material.dart';

class commen_view extends StatefulWidget {
  String _title;
  commen_view(this._title);

  @override
  _commen_viewState createState() => _commen_viewState();
}

class _commen_viewState extends State<commen_view> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(widget._title),),
      body: Container(
        child: Text(
            '这个是点击按钮跳过的界面',
          style: TextStyle(color: Colors.red,fontSize: 30.0),

        ),
        alignment: Alignment.center,
        color: Colors.lightBlueAccent,

      ),
    );
  }
}
