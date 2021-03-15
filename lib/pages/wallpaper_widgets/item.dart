import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color bgColor;
  final Function onTap;
  ItemButton({this.text = 'Download', this.icon = Icons.download_sharp, this.bgColor = Colors.grey, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Column(
        children: [

          Container(
            margin: EdgeInsets.only(bottom: 5),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: this.bgColor
            ),
            child: Icon(this.icon, size: 30, color: Colors.grey[300],),
          ),

          Text(this.text, style: TextStyle(color: Colors.white),),

        ],
      ),
    );
  }
}