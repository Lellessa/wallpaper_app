import 'package:flutter/material.dart';

class MainBottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff682279),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Icon(Icons.replay_outlined, size: 30, color: Colors.white.withOpacity(0.4),),
          Icon(Icons.replay_outlined, size: 30, color: Colors.white.withOpacity(0.4),),
          Icon(Icons.replay_outlined, size: 30, color: Colors.white.withOpacity(0.4),),
          Icon(Icons.replay_outlined, size: 30, color: Colors.white.withOpacity(0.4),),

        ],
      ),
    );
  }
}