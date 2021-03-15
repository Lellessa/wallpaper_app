import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/wallpaper_widgets/item.dart';

class WallpaperPage extends StatelessWidget {
  final String image;
  WallpaperPage({this.image}); 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(this.image)
          )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, size: 35, color: Colors.white,),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ItemButton(text: 'Info', icon: Icons.info_outline,),
                ItemButton(text: 'Download', icon: Icons.download_sharp,),
                ItemButton(
                  text: 'Apply', 
                  icon: Icons.play_arrow, 
                  bgColor: Colors.pink,
                  onTap: () {
                    // CODE HERE
                  },
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}