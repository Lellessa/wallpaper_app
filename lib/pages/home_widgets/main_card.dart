import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/wallpaper.dart';

class MainCard extends StatelessWidget {

  final String image;
  MainCard({this.image = 'assets/wall_1.jpg'});

  static double getRandom() {
    final double y = Random().nextInt(250)/100;
    if (y < 1.2)
      return getRandom();
    else
      return y;
  }

  final double y = getRandom();

  @override
  Widget build(BuildContext context) {

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