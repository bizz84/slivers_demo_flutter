import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/bottom_navigation.dart';
import 'package:slivers_demo_flutter/page.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/activities/activities_page.dart';
import 'package:slivers_demo_flutter/pages/hero_page.dart';
import 'package:slivers_demo_flutter/pages/slivers_basic_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Page _page = Page.basic;

  void _selectPage(Page page) => setState(() => _page = page);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: BottomNavigation(
        page: _page,
        onSelectPage: _selectPage,
      ),
    );
  }

  Widget _buildBody() {
    return <Page, WidgetBuilder>{
      Page.basic: (_) => SliversBasicPage(),
      Page.hero: (_) => HeroPage(),
      Page.fitnessTracker: (_) => ActivitiesPage.withSampleData(),
    }[_page](context);
  }
}
