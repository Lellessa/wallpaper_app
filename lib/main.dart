import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  List<Map<String, dynamic>> info = [
    {
      'y': 2,
      'color': Colors.blue
    },
    {
      'y': 3,
      'color': Colors.purple
    },
    {
      'y': 3,
      'color': Colors.pink
    },
    {
      'y': 3,
      'color': Colors.green
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: Column(
                  children: [

                    MainCard(),
                    MainCard(y: 2,),

                  ],
                ),
              ),
              
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  children: [

                    MainCard(y: 3,),
                    MainCard(y: 0.5,),

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

  final double y;
  MainCard({this.y = 1.5});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1/y,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        color: Colors.blue,
      ),
    );
  }
}