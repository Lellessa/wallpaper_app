import 'package:flutter/material.dart';

class ListWallpapers extends StatelessWidget {

  final List<Widget> column1, column2;
  final int qtdWallpapers;

  ListWallpapers({this.column1, this.column2, this.qtdWallpapers});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text('Wallpapers', style: TextStyle(color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),),
            Text('${qtdWallpapers.toString()} wallpapers available', style: TextStyle(color: Colors.white, fontSize: 16),),

            // WALLPAPERS
            SizedBox(height: 25),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: Column(
                    children: column1
                  ),
                ),
                
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: column2
                  ),
                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}