import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/activities/activity_split_header.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/activities/activity_split_row.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/models/split.dart';

class ActivitySplits extends StatelessWidget {
  const ActivitySplits(this.splits);
  final List<Split> splits;

  @override
  Widget build(BuildContext context) {
    final max = maxPace();
    final min = minPace();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 8.0),
        Text('Splits', style: Theme.of(context).textTheme.title),
        SizedBox(height: 8.0),
        ActivitySplitHeader(),
        SizedBox(height: 4.0),
        Divider(color: Colors.black12, height: 0.5),
        SizedBox(height: 8.0),
        for (var split in splits)
          ActivitySplitRow(
            split: split,
            maxPace: max,
            minPace: min,
          ),
      ],
    );
  }

  int maxPace() {
    final paces = splits.map((split) => split.pace.inSeconds);
    return paces.reduce((value, element) => max(value, element));
  }

  int minPace() {
    final paces = splits.map((split) => split.pace.inSeconds);
    return paces.reduce((value, element) => min(value, element));
  }
}
