import 'package:chanel_scroll_animation/chanel1/item.dart';
import 'package:chanel_scroll_animation/models/model.dart';
import 'package:flutter/material.dart';

class Chanel1Page extends StatefulWidget {
  @override
  _Chanel1PageState createState() => _Chanel1PageState();
}

class _Chanel1PageState extends State<Chanel1Page> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            for (int i = 0; i < models.length; i++)
              Item(item: models[i],)
          ],
        ),
      ),
    );
  }
}
