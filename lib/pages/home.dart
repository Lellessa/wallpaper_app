import 'package:flutter/material.dart';
import 'package:wallpaper_app/pages/home_widgets/bottom_menu.dart';
import 'package:wallpaper_app/pages/home_widgets/gradient_background.dart';
import 'package:wallpaper_app/pages/home_widgets/list_wallpapers.dart';
import 'package:wallpaper_app/pages/home_widgets/main_card.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> column1 = [];
  List<Widget> column2 = [];

  final int qtdWallpapers = 6;

  void populateColumns() {
    for (int i = 1; i <= qtdWallpapers; i++) {
      if (i.isEven)
        column1.add(MainCard(image: 'assets/wall_${i.toString()}.jpg'));
      else
        column2.add(MainCard(image: 'assets/wall_${i.toString()}.jpg'));
    }
  }

  @override
  void initState() {
    populateColumns();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainGradientBackground(
        child: SafeArea(
          child: Column(
            children: [

              // LIST OF WALLPAPERS
              Expanded(
                child: ListWallpapers(
                  column1: column1,
                  column2: column2,
                  qtdWallpapers: qtdWallpapers,
                )
              ),

              MainBottomMenu(),

            ],
          ),
        ),
      ),
    );
  }
}