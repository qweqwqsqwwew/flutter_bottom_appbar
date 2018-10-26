import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class photoHero extends StatelessWidget {

  const photoHero({Key key,this.photo,this.onTap,this.width})
  : super(key :key);

  final String photo;
  final VoidCallback onTap;
  final double width;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
          tag: photo,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              child: Image.network(
                photo,
                fit: BoxFit.contain,
              ),
            ),

          )),

    );
  }

}


class mine_page extends StatelessWidget{

  Widget build(BuildContext context) {
//    timeDilation = 2.0;
    return Scaffold(
      appBar: AppBar(title: Text('mine Page'),),
      body: Center(
        child: photoHero(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => detination_page()));
          },
          width: 300.0,
          photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
        ),
      ),
    );
  }
}


class detination_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('调转界面'),),
      body: Container(
        child: photoHero(
          onTap: (){
            Navigator.of(context).pop();
          },
          width: 200.0,
          photo: 'http://pic1.win4000.com/wallpaper/e/537ebd9b60603.jpg',
        ),
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(10.0),
        color: Colors.lightBlueAccent,
      ),


    );
  }
}

