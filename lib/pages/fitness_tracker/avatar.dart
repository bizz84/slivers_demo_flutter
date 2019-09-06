import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({Key key, this.photoUrl, this.radius = 50}) : super(key: key);
  final String photoUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: photoUrl == null ? Icon(Icons.camera_alt, size: radius) : null,
      backgroundImage: photoUrl != null ? NetworkImage(photoUrl) : null,
    );
  }
}
