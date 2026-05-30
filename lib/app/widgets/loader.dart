import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.color,
    this.size = 14,
    this.strokeWidth = 2,
    this.radius = 14,
  });

  final Color? color;
  final double size;
  final double strokeWidth;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(radius: radius, color: color)
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
            ),
    );
  }
}
