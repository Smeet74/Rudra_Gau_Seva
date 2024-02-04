import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
            alignment: Alignment.center,
            height: 120.sp,
            width: 120.sp,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15.sp)),
            child: LoadingAnimationWidget.discreteCircle(
              color: Colors.white,
              size: 50,
            )),
      ),
    );
  }
}