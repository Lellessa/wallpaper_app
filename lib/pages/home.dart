import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  final int qtdWallpapers = 6;


  Future<Map> getImages() async {
    
    Map<String, List<Widget>> columns = {};
    List<Widget> column1 = [];
    List<Widget> column2 = [];

    for (int i = 1; i <= qtdWallpapers; i++) {
      Reference ref = FirebaseStorage.instance.ref().child('wallpapers').child('wall_${i.toString()}.jpg');
      String url = await ref.getDownloadURL();

      if (i.isEven)
        column1.add(MainCard(url: url));
      else
        column2.add(MainCard(url: url));
    }

    columns['first'] = column1;
    columns['second'] = column2;

    return columns;
  }

  void logIn() async {
    if (FirebaseAuth.instance.currentUser.uid == null)
      await FirebaseAuth.instance.signInAnonymously();
  }

  Future<Map<String, List<Widget>>> initConfigs() async {
    logIn();
    return await getImages();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: FutureBuilder(
        future: initConfigs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Text('Carregando'),
              );
            case ConnectionState.done:
            case ConnectionState.active:
              return MainGradientBackground(
                child: SafeArea(
                  child: Column(
                    children: [

                      // LIST OF WALLPAPERS
                      Expanded(
                        child: ListWallpapers(
                          column1: snapshot.data['first'],
                          column2: snapshot.data['second'],
                          qtdWallpapers: qtdWallpapers,
                        )
                      ),

                      MainBottomMenu(),

                    ],
                  ),
                ),
              );
            default:
              return Text('Default');
          }

        },
      ),
    );

  }
}