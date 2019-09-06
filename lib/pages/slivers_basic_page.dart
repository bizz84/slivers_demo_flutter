import 'package:flutter/material.dart';

class SliversBasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //pinned: true,
          //floating: true,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            //background: ,
            title: Text('Slivers'),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}
