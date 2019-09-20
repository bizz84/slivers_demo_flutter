import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:slivers_demo_flutter/pages/networking/networking_page_content.dart';
import 'package:slivers_demo_flutter/pages/networking/networking_page_header.dart';

class NetworkingPage extends StatelessWidget {
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
            pinned: false,
            floating: true,
            delegate: NetworkingPageHeader(
              minExtent: 150.0,
              maxExtent: 250.0,
            ),
          ),
          NetworkingPageContent(),
          // SliverFillRemaining(
          //   child: Center(
          //     child: Text(
          //       'No Content',
          //       style: Theme.of(context).textTheme.headline,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
