import 'package:drone4u_dashboard/constants.dart';
import 'package:flutter/material.dart';

class D4uBackground extends StatelessWidget {
  final Widget child;
  const D4uBackground({
    Key? key,
    required this.child,
    this.topImage = "assets/images/drone4uLogo.png",
    this.bottomImage = "assets/images/logo.png",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.white54,
              Colors.red,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 10,
              left: 20,
              child: Row(
                children: [
                  Image.asset(
                    topImage,
                    width: 100,
                  ),
                  Text(
                    'Drone4u',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Image.asset(bottomImage, width: 120),
            // ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
