import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key, this.page, this.onSelectPage})
      : super(key: key);
  final Page page;
  final ValueChanged<Page> onSelectPage;

  Color _color(Page page) => this.page == page ? Colors.indigo : Colors.grey;

  static const Map<Page, IconData> icons = {
    Page.basic: Icons.view_headline,
    Page.fetch: Icons.cloud_download,
    Page.custom: Icons.directions_run,
    Page.nested: Icons.table_chart,
  };
  static const Map<Page, String> names = {
    Page.basic: 'basic',
    Page.fetch: 'fetch',
    Page.custom: 'custom',
    Page.nested: 'nested',
  };

  BottomNavigationBarItem _buildItem(Page page) {
    return BottomNavigationBarItem(
      icon: Icon(
        icons[page],
        color: _color(page),
      ),
      title: Text(
        names[page],
        style: TextStyle(
          color: _color(page),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: Page.values.map(_buildItem).toList(),
      onTap: (index) => onSelectPage(Page.values[index]),
    );
  }
}
