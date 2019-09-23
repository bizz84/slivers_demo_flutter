import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/pages/networking/networking_page_content.dart';
import 'package:slivers_demo_flutter/pages/networking/networking_page_header.dart';

class NetworkingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
