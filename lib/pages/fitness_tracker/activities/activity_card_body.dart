import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/models/activity.dart';

class ActivityCardMetric extends StatelessWidget {
  const ActivityCardMetric({Key key, this.label, this.value}) : super(key: key);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: Theme.of(context).textTheme.caption),
        Text(value, style: Theme.of(context).textTheme.title),
      ],
    );
  }
}

class ActivityCardBody extends StatelessWidget {
  const ActivityCardBody({Key key, this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (activity.description != null)
          Text(activity.description, style: Theme.of(context).textTheme.title),
        SizedBox(height: 16.0),
        Row(
          children: <Widget>[
            Expanded(
              child: ActivityCardMetric(
                label: 'Distance',
                value: activity.distance,
              ),
            ),
            Expanded(
              child: ActivityCardMetric(
                label: 'Pace',
                value: activity.pace,
              ),
            ),
            Expanded(
              child: ActivityCardMetric(
                label: 'Time',
                value: activity.time,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
