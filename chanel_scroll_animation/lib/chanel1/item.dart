import 'package:chanel_scroll_animation/models/model.dart';
import 'package:flutter/material.dart';
import 'package:interpolate/interpolate.dart';

const double MIN_HEIGHT = 128;
class Item extends StatefulWidget {
  final Model item;
  final int index;
  final double y;
  Item({this.item,this.index,this.y});

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {

  Interpolate ipHeight;
  double maxHeight=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Size size=MediaQuery.of(context).size;
     maxHeight=size.height/2;
     initInterpolate();
   });
  }

  initInterpolate()
  {
    ipHeight=Interpolate(
      inputRange: [(widget.index-1)*maxHeight,widget.index*maxHeight],
      outputRange: [MIN_HEIGHT,maxHeight],
      extrapolate: Extrapolate.clamp,
    );
  }
  @override
  Widget build(BuildContext context) {
    // final Size size=MediaQuery.of(context).size;
    double height=ipHeight!=null? ipHeight.eval(widget.y):MIN_HEIGHT;

    // print("height "+height.toString());

    return Container(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              widget.item.picture,
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
                  widget.item.subtitle,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.item.title.toUpperCase(),
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
