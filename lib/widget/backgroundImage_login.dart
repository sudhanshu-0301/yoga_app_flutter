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
          // padding: EdgeInsets.symmetric(
          //     horizontal: appPadding / 2, vertical: appPadding / 0.4),
          padding: EdgeInsets.only(
              left: appPadding / 2,right: appPadding / 2 , top: appPadding / 0.8,bottom: appPadding / 0.3),
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
