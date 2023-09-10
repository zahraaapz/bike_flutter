import 'package:bike_flutter/Detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff5d716f),
        primaryColor: Color(0xff708985),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List cate = ['popular', 'New Arrival', 'Sale'];
  List ima = ['assets/car-engine.png', 'assets/wheel.png', 'assets/steering-wheel.png'];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        actions: [
          Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 30,
          ),SizedBox(width: 20,),
          Icon(Icons.more_vert_outlined, color: Colors.white, size: 30)
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.apps, color: Colors.white, size: 30),
      ),
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width / 6.5,
                height: size.height,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: const Color.fromARGB(141, 0, 0, 0)),
                    BoxShadow(color: Colors.black)
                  ],
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 40,
                      ),
                      for (int j = 0; j < cate.length; j++) ...[
                        RotatedBox(
                          quarterTurns: 3,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  cate[j],
                                  style: TextStyle(
                                      color: j == 1
                                          ? Colors.white
                                          : Color(0xffa3bab6)),
                                ),
                                SizedBox(
                                  height: size.width / 40,
                                ),
                                Container(
                                  width: size.width / 15,
                                  height: size.width / 80,
                                  color:
                                      j == 1 ? Color(0xffa3bab6) : Colors.white,
                                )
                              ]),
                        ),
                      ],
                    ]),
              ),
              Stack(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => DetailPage(),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                    ),
                    child: SizedBox(
                        width: size.width / 1.4,
                        height: size.height / 2.2,
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        elevation: 12,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(5,5,5,0),
                                child: Row(
                                  children: [
                                    
                                    Icon(CupertinoIcons.star_fill
                                    ,
                                        color: Colors.yellow, size: 25),
                                                             Text(
                                      ' 4.5',
                                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                                    ),SizedBox(width: 30,),Spacer(),
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 25,
                                    )
                                  ],
                                ),
                              ),
                                               Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text('Art Bike \n \$5,560',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                            Container(
                              width: 40,
                              height: 40,
                                               child: Icon(Icons.lock_outlined,color: Colors.white),
                              decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2),borderRadius: BorderRadius.circular(3)),
                            )
                           ],),
                                               )   ],
                          ),
                        )),
                  ),
                ),
              ]),
            ],
          ),
          Positioned(
              bottom: 300,
              left: 80,
              child: Hero(
                tag: '0',
                child: Image.asset(
                  'assets/bike.png',
                  scale: 3,
                ),
              )),
          Positioned(
              top: 100,
              left: 30,
              child: Text(
                'BIKES \nCOLLECTION',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              )),
              Positioned(
                bottom: 70,
               right: 50,
                child: SizedBox(
                  height: 90,
                  child: ListView.builder(padding: EdgeInsets.all(8),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: ima.length,
                    itemBuilder:(context, index) {
                      return Card(
                        margin: EdgeInsets.all(5),
                       color: Theme.of(context).primaryColor,
                       elevation: 10,
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                       child: ImageIcon(Image.asset(ima[index],scale: 10,).image,color: Colors.white,size: 60,),
                      );
                  },),
                ),
              )
        ],
      ),
    );
  }
}
