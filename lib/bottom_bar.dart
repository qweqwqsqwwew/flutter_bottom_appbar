import 'package:flutter/material.dart';
import 'commen_view.dart';
import 'home_page.dart';
import 'mine_hero.dart';
class bottom_bar extends StatefulWidget {
  @override
  _bottom_barState createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {

  List<Widget> _commenArr;
  int _index = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commenArr = List();
    _commenArr..add(home_page())..add(mine_page());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _commenArr[_index],
      floatingActionButton: new FloatingActionButton(
          onPressed: (){
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
               return commen_view('newHome');
         }));
        },
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.near_me),
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    _index = 0;
                  });
                }),
            IconButton(
                icon: Icon(Icons.share),
                color: Colors.white,
                onPressed: (){
                  setState(() {
                    _index = 1;
                  });
                })
          ],
        ),
      ),
    );
  }



}
