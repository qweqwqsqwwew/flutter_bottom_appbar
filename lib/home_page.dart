import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  List<String> _images;
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _images = List();
    _controller = ScrollController();
    fetchten();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
          fetchten();
      }
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页'),),
      body: ListView.builder(
          itemCount: _images.length,
          controller: _controller,
          itemBuilder: (BuildContext context,int index){
            return Container(
                child: Image.network(_images[index],
                fit: BoxFit.cover,
                ),

            );
          },
      ),

    );
  }

  fetch()async{
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if(response.statusCode == 200){
      setState(() {
        _images.add(json.decode(response.body)['message']);
      });
    }else{
      throw Exception('图片加载失败');
    }
  }

  fetchten(){

    for(int i = 0; i < 10; i ++){
      fetch();
    }

  }

}
