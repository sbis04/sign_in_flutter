import 'package:flutter/material.dart';

class ScalePageTransition extends PageRouteBuilder {
  final Widget widget;

  ScalePageTransition({this.widget})
    : super(
      maintainState: true,
      pageBuilder: (context, animation, secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 1500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.20,
                0.80,
                curve: Curves.easeInOut,
              ),
            ),
          ),
          child: child,
        );
      }
    );
}