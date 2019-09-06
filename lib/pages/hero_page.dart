import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({
    this.minExtent,
    @required this.maxExtent,
  });
  final double maxExtent;
  final double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/ronnie-mayo-361348-unsplash.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
          child: Text(
            'Hero Image',
            style: TextStyle(
              fontSize: 32.0,
              color: Colors.white.withOpacity(1.0 - shrinkOffset / maxExtent),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;
}

class HeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrollView(context),
    );
  }

  Widget _scrollView(BuildContext context) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            //pinned: true,
            delegate: HeroHeader(
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Text(
                'No Content',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
