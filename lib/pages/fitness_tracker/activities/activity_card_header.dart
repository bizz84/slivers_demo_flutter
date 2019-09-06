import 'package:flutter/material.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/avatar.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/models/activity.dart';
import 'package:slivers_demo_flutter/pages/fitness_tracker/models/user.dart';

class ActivityCardHeader extends StatelessWidget {
  const ActivityCardHeader({Key key, this.user, this.activity})
      : super(key: key);
  final User user;
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Avatar(radius: 15),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (user.displayName != null)
              Text(
                user.displayName,
                style: Theme.of(context).textTheme.subtitle,
              ),
            Text(
              activity.dateTime,
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        )
      ],
    );
  }
}
