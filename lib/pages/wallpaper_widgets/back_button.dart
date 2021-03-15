import 'package:flutter/material.dart';

class MainBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Icon(Icons.arrow_back, size: 35, color: Colors.white,),
    );
  }
}