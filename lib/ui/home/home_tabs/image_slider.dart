import 'package:e_comerce/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: ImageSlideshow(
        indicatorColor: MyTheme.mainColor,
        initialPage: 0,
        indicatorBackgroundColor:MyTheme.whiteColor ,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.asset(
            'assets/images/image1.png',
            fit: BoxFit.cover,
            width: 398.w,
            height: 200.h,
          ),
          Image.asset(
            'assets/images/image2.png',
            fit: BoxFit.cover,
            width: 398.w,
            height: 200.h,
          ),
          Image.asset(
            'assets/images/image3.png',
            fit: BoxFit.cover,
            width: 398.w,
            height: 200.h,
          ),
        ],
      ),
    );
  }
}
