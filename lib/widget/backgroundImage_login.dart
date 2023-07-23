import 'package:flutter/material.dart';
import 'package:yoga_app/helper/colors.dart';
import 'package:yoga_app/widget/curveclipper_login.dart';

class BackgroundImage extends StatelessWidget {
  // const BackgroundImage({super.key});
  final String imgURL;
  final double height;

  BackgroundImage({
    required this.imgURL,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    
    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        height: height,
        color: blueGrey.withOpacity(0.8),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: appPadding / 1, vertical: appPadding / 0.5),
          child: Center( 
            child: Image(
              fit: BoxFit.fitHeight,
              image: AssetImage(imgURL),
            ),
          ),
        ),
      ),
    );
  }
}
