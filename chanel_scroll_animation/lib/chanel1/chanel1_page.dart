import 'package:chanel_scroll_animation/chanel1/item.dart';
import 'package:chanel_scroll_animation/chanel1/snapping_list_view.dart';
import 'package:chanel_scroll_animation/models/model.dart';
import 'package:flutter/material.dart';


class Chanel1Page extends StatefulWidget {
  @override
  _Chanel1PageState createState() => _Chanel1PageState();
}

class _Chanel1PageState extends State<Chanel1Page> {
  ScrollController _scrollController;
  double y=0;
  double maxHeight=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController=new ScrollController();
    _scrollController.addListener(() {
      // print("_scrollController.offset.toString() "+_scrollController.offset.toString());


      setState(() {
        y=_scrollController.offset;
      });

    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final Size size=MediaQuery.of(context).size;
      setState(() {
        maxHeight=size.height/2;
      });

    });

  }


  @override
  Widget build(BuildContext context) {
    final scrollPhysics = SnappingListScrollPhysics(
        snapInterval:maxHeight,
        itemExtent: maxHeight);
    return Scaffold(
      body: SafeArea(
        child: maxHeight!=0?ListView(
          controller: _scrollController,
           physics: scrollPhysics,
            scrollDirection: Axis.vertical,
          children: [

            Container(
              height:  ( models.length +1) * maxHeight,

              child: Column(
                children: [
                  for (int i = 0; i < models.length; i++)
                    Item(item: models[i],index: i,y: y,)
                ],
              ),
            )

          ],
        ):Container(),
      ),

    );
  }
}
