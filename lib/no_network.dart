import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:connectivity/connectivity.dart';

import 'login_page.dart';
import 'scale_page_transition.dart';

class NoNetwork extends StatefulWidget {
  @override
  _NoNetworkState createState() => _NoNetworkState();
}

class _NoNetworkState extends State<NoNetwork> with TickerProviderStateMixin {
  StreamSubscription<ConnectivityResult> subscription;
  AnimationController logoAnimationController;
  AnimationController textAnimationController;
  Tween logoTween;
  Animation logoAnimation;
  Animation textAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controllers for the wifi icon and text
    logoAnimationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this)..addListener(() => setState(() {}));
    textAnimationController = AnimationController(duration: Duration(milliseconds: 500), vsync: this)..addListener(() => setState(() {}));
    logoTween = Tween<double>(begin: 1, end: 2);
    logoAnimation = logoTween.animate(CurvedAnimation(parent: logoAnimationController,curve: Curves.easeInOut))..addListener(() => setState(() {}));
    textAnimation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(parent: textAnimationController,curve: Curves.easeInOut))..addListener(() => setState(() {}));

    // Listen for connectivity changes
    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
      // Bring user to login page once the app establishes a connection
      if (result != ConnectivityResult.none) {
        // Start animations before navigating screens
        await animateLogoAndText();

        // Navigate to the login page after the animations are complete
        await Navigator.of(context, rootNavigator: true).pushReplacement(
          ScalePageTransition(widget: LoginPage()),
        );
      }
    });
  }

  Future<void> animateLogoAndText() async {
    await logoAnimationController.forward().then((_) {
      // Set the start value of the logo animation to 0 so that it can completely
      // shrink and disappear from the screen at the end of the animation cycle
      logoTween.begin = 0.0;
    });
    await logoAnimationController.reverse();
    await textAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: logoAnimation.value,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300],
                highlightColor: Colors.grey[100],
                child: Icon(Icons.wifi, size: 250,),
              ),
            ),
            Transform.scale(
              scale: textAnimation.value,
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: Text(
                  'You are currently offline. Please check your connections.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black38,
                    decoration: TextDecoration.none,
                    fontSize: 32,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
          ],
        ),
      ),
      floatingActionButton: Hero(
        tag: 'FlutterHero',
        child: FlutterLogo(size: 50),
      ),
    );
  }

  @override
  dispose() {
    super.dispose();

    subscription.cancel();
    logoAnimationController..removeListener(() {})..dispose();
    textAnimationController..removeListener(() {})..dispose();
    logoAnimation.removeListener(() {});
    textAnimation.removeListener(() {});
  }
}