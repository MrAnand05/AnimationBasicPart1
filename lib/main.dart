import 'package:flutter/material.dart';
//0. Animation concept and Classes
//1. Rendering Animation
//2. Animated Widget
//3. Animated Builder
//4. Stagered Animation

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation_Part1',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHomeState createState() => MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;
  Animation<Color> colorTween;
  Animation<int> intAnimation;
  int i=1;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _controller=AnimationController(
        duration: Duration(milliseconds: 3000),
        vsync: this
        );
        Animation curve=CurvedAnimation(parent: _controller,curve: Curves.easeIn);
        intAnimation=Tween(begin: 1,end: 100).animate(curve)
        ..addListener((){
          
        });
        animation=Tween(begin: 0.0,end: 100.0).animate(_controller)
        ..addListener((){
          setState(() {
                      
                    });
          print('Frame:${i}-Controller:${_controller.value}-Animat:${animation.value}');
          i++;
        });
        colorTween=ColorTween(begin: Colors.pink,end: Colors.green).animate(_controller)  
        ..addListener((){

        });
        _controller.forward();
    }

    @override
      void dispose() {
        _controller.dispose();
        // TODO: implement dispose
        super.dispose();
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
              child: Text(
        'Anand',
        style: TextStyle(fontSize: animation.value, color: colorTween.value),
      ))),
    );
  }
}
