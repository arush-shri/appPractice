import 'package:flutter/material.dart';
import 'package:yogapractice/views/CustomAppBar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorTween,_homeTween,_yogaTween,_iconTween,_drawerTween;
  late AnimationController _textAnimationController;
  
  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white).animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue).animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue).animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black).animate(_animationController);
    _textAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 0));
    super.initState();
  }

  bool scrollListener(ScrollNotification scrollNotification){
    bool scroll = false;
    if(scrollNotification.metrics.axis == Axis.vertical){
      _animationController.animateTo(scrollNotification.metrics.pixels/100);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(),
        backgroundColor: Colors.white,
        body: NotificationListener(
          onNotification: scrollListener,
          child: SizedBox(
                height: double.infinity,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child:
                          Column(
                            children: [
                              Container(height: 1000, color: Colors.red,),
                              Container(height: 1000, color: Colors.green,),
                              Container(height: 1000, color: Colors.yellow,)
                            ],
                          )
                    ),
                    CustomAppBar(animationController: _animationController, colorsTween: _colorTween, drawerTween: _drawerTween, homeTween: _homeTween,
                        iconTween: _iconTween, yogaTween: _yogaTween, onPressed: (){scaffoldKey.currentState?.openDrawer();})
                  ],
                ),
              )
            ),
      ),
    );
  }
}


