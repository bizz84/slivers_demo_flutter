import 'package:flutter/material.dart';

class ActivitySplitHeader extends StatelessWidget {
  const ActivitySplitHeader(
      {Key key, this.kmWidth = 40, this.paceWidth = 50, this.elevWidth = 40})
      : super(key: key);
  final double kmWidth;
  final double paceWidth;
  final double elevWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: kmWidth,
          child: Text('KM', style: Theme.of(context).textTheme.caption),
        ),
        SizedBox(
          width: paceWidth,
          child: Text('PACE', style: Theme.of(context).textTheme.caption),
        ),
        Expanded(
            child: Row(
          children: <Widget>[],
        )),
        SizedBox(
          width: elevWidth,
          child: Text('ELEV',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.right),
        ),
      ],
    );
  }
}
