import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NoNetwork extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.grey[300],
            highlightColor: Colors.grey[100],
            child: Icon(Icons.wifi, size: 250,),
          ),
          Text(
            'You are currently offline. Please check your connections.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black38,
              decoration: TextDecoration.none,
              fontSize: 32,
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }
}