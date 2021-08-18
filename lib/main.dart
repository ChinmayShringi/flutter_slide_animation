import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var imageAssets = ['assets/1.jpg', 'assets/2.jpg'];
  var icon = [Icons.alarm,Icons.location_on_outlined];
  var titles=['Connect With\nother skincare\nlovers.','The perfect\nproduct for your\nskin type.'];
  var subtitles=['Engage with others in\nthe community.','Find products\nthat work for you'];
  var i=0;
  var size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body:GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            if(i!=1) {
              setState(() {
                i = i + 1;
              });
            }
          }
          if (details.delta.dx < 0) {
            if(i!=0) {
              setState(() {
                i = i - 1;
              });
            }
          }
        },
        child:  Container(
          child:
          Container(
            height: double.infinity,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          this.imageAssets[i]),
                      fit: BoxFit.fill,
                    ),
                  ),
                  height: size.height/2,
                ),
                Positioned(
                  top: size.height / 2,
                  child: Container(
                    height: size.height / 2 + 40,
                    width: size.width,
                    padding: EdgeInsets.all(0),
                    child: Card(
                      margin: EdgeInsets.all(0),
                      elevation: 5,
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: size.height / 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    this.titles[i],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 38,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                this.subtitles[i],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          SizedBox(height:20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Skip',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 2 - 35,
                  left: size.width / 2 - 35,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Icon(this.icon[i])],
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),

      ),
      ),
    );
  }
}