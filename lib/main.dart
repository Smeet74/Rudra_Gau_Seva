import 'package:birthday_post/selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              theme: ThemeData(
                  textTheme: TextTheme(
                      bodyLarge: TextStyle(fontWeight: FontWeight.w500),
                      bodyMedium: TextStyle(fontWeight: FontWeight.w500),
                      bodySmall: TextStyle(fontWeight: FontWeight.w500))),
              debugShowCheckedModeBanner: false,
              home: SelectionScreen());
        });
  }
}
