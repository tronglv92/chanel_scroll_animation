import 'package:chanel_scroll_animation/models/model.dart';
import 'package:flutter/material.dart';
class Item extends StatelessWidget {
  final Model item;
  Item({this.item});
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;

    return Container(
      height: size.height/2,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              item.picture,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom:40,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Text(
                  item.subtitle,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  item.title.toUpperCase(),
                  style: TextStyle(fontSize: 24, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
