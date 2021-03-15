import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/pages/wallpaper.dart';

void main() async {
  runApp(MyApp());
  await SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  List<Widget> coluna1 = [];
  List<Widget> coluna2 = [];

  @override
  Widget build(BuildContext context) {

    for (int i = 1; i <= 6; i++) {
      if (i.isEven)
        coluna1.add(MainCard(image: 'assets/wall_${i.toString()}.jpg'));
      else
        coluna2.add(MainCard(image: 'assets/wall_${i.toString()}.jpg'));
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0e0023),
              Color(0xff3a1e54),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [

              // LIST OF WALLPAPERS
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text('Wallpapers', style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),),
                        Text('8 wallpapers available', style: TextStyle(color: Colors.white, fontSize: 16),),

                        // WALLPAPERS
                        SizedBox(height: 25),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Column(
                                children: coluna1
                              ),
                            ),
                            
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Column(
                                children: coluna2
                              ),
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff682279),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Icon(Icons.replay_outlined, size: 30, color: Colors.white,),
                    Icon(Icons.replay_outlined, size: 30, color: Colors.white,),
                    Icon(Icons.replay_outlined, size: 30, color: Colors.white,),
                    Icon(Icons.replay_outlined, size: 30, color: Colors.white,),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MainCard extends StatelessWidget {

  final String image;
  MainCard({this.image = 'assets/wall_1.jpg'});

  double getRandom() {
    final double y = Random().nextInt(250)/100;
    if (y < 1.2)
      return getRandom();
    else
      return y;
  }

  @override
  Widget build(BuildContext context) {

    final double y = getRandom();

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>WallpaperPage(image: this.image,))),
      child: AspectRatio(
        aspectRatio: 1/y,
        child: Container(
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                this.image
              ),
            )
          ),
        ),
      ),
    );
  }
}