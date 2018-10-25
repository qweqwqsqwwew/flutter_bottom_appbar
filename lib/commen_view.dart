import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class commen_view extends StatefulWidget {
  String _title;
  commen_view(this._title);

  @override
  _commen_viewState createState() => _commen_viewState();
}

class _commen_viewState extends State<commen_view> {

  Future<Null> _lauched;

  Future<Null> _lauch_brower(String url) async{
    if(await canLaunch(url)){
      await launch(url, forceSafariVC: false,forceWebView: false);
    }else{
      throw'不能打开网页';
    }
  }

  Future<Null> _laucnch_invc(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw '不能在界面上打开网页';
    }
  }
  
  
  Widget _launchStatus(BuildContext context, AsyncSnapshot<Null> snapshot){
    if(snapshot.hasError){
      
      return new Text('erroe ${snapshot.error}');
    }else{
      return const Text('跳转成功');
    }
  }

  @override
  Widget build(BuildContext context) {
    const url = 'http://www.baidu.com';
    return Scaffold(

      appBar: AppBar(title: Text(widget._title),),
//      body: Container(
//        child: Text(
//            '这个是点击按钮跳过的界面',
//          style: TextStyle(color: Colors.red,fontSize: 30.0),
//
//        ),
//        alignment: Alignment.center,
//        color: Colors.lightBlueAccent,
//
//      ),
    body: new Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '这个是点击按钮跳过的界面',
            style: TextStyle(color: Colors.red,fontSize: 30.0),
          ),
          new RaisedButton(
              onPressed: (){
                    setState(() {
                          _lauched = _lauch_brower(url);
                    });
                    
              },
            child: Text('用safari打开网页'),
          ),
          new RaisedButton(
            onPressed: (){
              setState(() {
                _lauched = _laucnch_invc(url);
              });

            },
            child: Text('在app内部代开网页'),
          ),
          const Padding(padding: const EdgeInsets.all(16.0)),
          new FutureBuilder(builder: _launchStatus,future: _lauched,),
        ],
      ),

    ),
    );
  }
}
