import 'package:flutter/material.dart';

class MainGradientBackground extends StatelessWidget {

  final Widget child;
  MainGradientBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: this.child,
    );
  }
}