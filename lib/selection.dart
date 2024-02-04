import 'package:birthday_post/BirthDay/birthday_screen.dart';
import 'package:birthday_post/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'સ્વર્ગવાસ/સ્વર્ગવાસ_screen.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(bg), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BirthdayScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 70.h,
                decoration: BoxDecoration(
                    color: themeColor.withOpacity(0.7),
                    border: Border.all(color: themeColor, width: 2.sp),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  children: [
                    Icon(
                      Icons.celebration_outlined,
                      size: 40.sp,
                      color: secondaryColor,
                    ),
                    SizedBox(width: 20.w),
                    Text("જન્મદિવસ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: secondaryColor))
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TithiScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30.w),
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                height: 70.h,
                decoration: BoxDecoration(
                    color: themeColor.withOpacity(0.7),
                    border: Border.all(color: themeColor, width: 2.sp),
                    borderRadius: BorderRadius.circular(20.sp)),
                child: Row(
                  children: [
                    Icon(
                      Icons.cloud_circle_outlined,
                      size: 40.sp,
                      color: secondaryColor,
                    ),
                    SizedBox(width: 20.w),
                    Text("સ્વર્ગવાસ",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: secondaryColor))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
