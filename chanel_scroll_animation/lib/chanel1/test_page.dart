import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel in vertical scrollable'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        if (index % 2 == 0) {
          return _buildCarousel(context,index);
        } else {
          return Divider();
        }
      }),
    );
  }

  Widget _buildCarousel(BuildContext buildContext, int carouseIndex) {
    return Column(
      children: [
        Text('Carousel ' + carouseIndex.toString()),
        SizedBox(
          height: 200,
          child: PageView.builder(
              controller: PageController(viewportFraction: 0.8),
              itemBuilder: (BuildContext context, int itemIndex) {
                return _buildCarouselItem(context, carouseIndex, itemIndex);
              }),
        )
      ],
    );
  }
  Widget _buildCarouselItem(BuildContext context, int carouselIndex, int itemIndex) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
      ),
    );
  }
}
