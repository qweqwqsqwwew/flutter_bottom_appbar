import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'bottom_bar.dart';

class slider_screen extends StatefulWidget {
  @override
  _slider_screenState createState() => _slider_screenState();
}

class _slider_screenState extends State<slider_screen> {


  List<Slide> slides = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    slides.add(
      new Slide(
        title: 'Flutter',
        description: 'dhsjhfdjhshjfjhjshjhjfdshjfdhjshjfhjhjdsfhjdhjhfjd',
        pathImage: 'assets/images/flutter.png',
        backgroundColor: 0xfff5a623,
      ),
    );
    slides.add(
      new Slide(
          title: 'dart',
          description: 'dhsjhfewfwejwjfiewojfijorjiogrijoeshjfdhjshjfhjhjdsfhjdhjhfjd',
          pathImage: 'assets/images/dart.png',
          backgroundColor: 0xff203152,
      ),
    );
    slides.add(
      new Slide(
          title: 'Flutterbgg',
          description: 'fgewifgehwgfjshjfhjhjdsfhjdhjhfjd',
          pathImage: 'assets/images/flutterlogo.png',
          backgroundColor: 0xff9932CC,
      ),
    );

  }


  void onDonePress(){
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context)=>bottom_bar()),
          (route)=>route == null);
  }

  voidonSkipPress(){
    Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => bottom_bar()),
            (route) => route == null);
  }


  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        slides: this.slides,
      onDonePress: this.onDonePress,
      onSkipPress: this.onDonePress,
    );
  }
}
