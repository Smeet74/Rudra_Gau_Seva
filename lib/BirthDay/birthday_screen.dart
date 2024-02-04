import 'package:birthday_post/Controller/birthday_controller.dart';
import 'package:birthday_post/Utils/constant.dart';
import 'package:birthday_post/Utils/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';


class BirthdayScreen extends StatelessWidget {
  BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: 
      
      GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus()
,
        child: GetBuilder(
            init: BirthdayManager(context: context),
            builder: (homeController) {
              return SafeArea(
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 10.w),
                            InkWell(
                              onTap: () =>
                                  _showModalBottomSheet(context, homeController),
                              child: Row(
                                children: [
                                  Text("Add Image"),
                                  SizedBox(width: 5.w),
                                  Icon(
                                    Icons.photo_library_outlined,
                                    color: Colors.blue,
                                  )
                                ],
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () => homeController.selectDate(context),
                              child: Row(
                                children: [
                                  Text("Select Birth Date"),
                                  SizedBox(width: 5.w),
                                  Icon(
                                    Icons.calendar_month_outlined,
                                    color: Colors.green,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: 10.w),
                          ],
                        ),
                        SizedBox(
                          height: 25.h,
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                "Enter Name: ",
                                style: TextStyle(
                                    fontSize: 10.sp, fontWeight: FontWeight.bold),
                              ),
                              Flexible(
                                child: TextField(
                                  controller: homeController.nameController,
                                  onChanged: (value) {
                                    homeController.checkInputFields();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Text(
                                "Amount: ",
                                style: TextStyle(
                                    fontSize: 10.sp, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 200.w,
                                child: TextField(
                                  controller: homeController.amountController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    homeController.checkInputFields();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Screenshot(
                          controller: homeController.screenshotController,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(bg), fit: BoxFit.fill),
                              // color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  // margin: EdgeInsets.all(2.sp),
                                  padding: EdgeInsets.all(5.sp),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2.sp, color: themeColor)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.5.sp, color: themeColor)),
                                    child: Column(
                                      // shrinkWrap: true,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 55.h),
                                        Text(
                                            "ગૌ સેવા એજ સફળતા, શાંતિ અને આનંદનો માર્ગ",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(height: 20.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Opacity(
                                                opacity: 0.6,
                                                child: Image(
                                                    image: AssetImage(cowr),
                                                    height: 90.h)),
                                            Container(
                                              height: 160.h,
                                              width: 125.w,
                                              decoration: BoxDecoration(
                                                  border: Border.all()),
                                              // color: Colors.redAccent,
                                              child:
                                                  (homeController.selectedImage !=
                                                          null)
                                                      ? Image.file(
                                                          homeController
                                                              .selectedImage!,
                                                          height: 160.h,
                                                          width: 125.w,
                                                          fit: BoxFit.fill,
                                                        )
                                                      : Image(
                                                          image: AssetImage(cow),
                                                          height: 160.h,
                                                          width: 125.w,
                                                        ),
                                            ),
                                            Opacity(
                                                opacity: 0.6,
                                                child: Image(
                                                    image: AssetImage(cow),
                                                    height: 90.h))
                                          ],
                                        ),
                                        SizedBox(height: 15.h),
                                        Text(
                                            "તા. ${homeController.formattedDate} ના રોજ",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w600)),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          child: Text(
                                            "${homeController.nameController.text} ના જન્મ દિવસ નિમિતે",
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            style: TextStyle(
                                                height: 1.1.h,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w800,
                                                color: primaryColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30.w),
                                          child: Column(
                                            children: [
                                              Text(
                                                "અંકે રૂ.${homeController.amountController.text}/- બીમાર ગાય ની સારવાર અર્થે...",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    height: 1.1.h,
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w800,
                                                    color: primaryColor),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                  "જન્મદિવસની ખુબ ખુબ શુભેચ્છાઓ...",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              SizedBox(height: 5.h),
                                              Text(
                                                  "ગૌ માતાના આશીર્વાદ સદાય આપના પર વરસતા રહે\nએવી રુદ્ર ગૌ સેવા મિત્ર મંડળ ગ્રુપ તરફથી પ્રાર્થના\nજય ગૌ માતા",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w600)),
                                              Row(
                                                children: [
                                                  Icon(Icons.circle,
                                                      size: 12.sp,
                                                      color: themeColor),
                                                  Expanded(
                                                    child: Divider(
                                                      height: 0,
                                                      thickness: 1.sp,
                                                    ),
                                                  ),
                                                  Icon(Icons.circle,
                                                      size: 12.sp,
                                                      color: themeColor)
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10.h
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6.w),
                                          height: 75.sp,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    // color: Colors.amberAccent,
                                                    height: 60.sp,
                                                    width: 60.sp,
                                                    child: Image(
                                                        image: AssetImage(logo)),
                                                  ),
                                                  Text(
                                                    "રજીસ્ટર નં - ૯૩૮૭ - સુરત",
                                                    textAlign: TextAlign.center,
                                                    style:
                                                        TextStyle(fontSize: 6.sp),
                                                  )
                                                ],
                                              ),
                                              SizedBox(width: 3.w),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      "આ સેવામાં આપણું અનુદાન અર્પણ કરવા અથવા\nસેવામાં જોડાવા માટે નીચે આપેલા નંબર પર સંપર્ક કરી શકો છો",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 8.sp,
                                                          fontWeight:
                                                              FontWeight.w600
                                                              ),
                                                    ),
                                                    // Spacer(),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Image(
                                                                image: AssetImage(
                                                                    call),
                                                                height: 14.sp),
                                                            Text(
                                                              "  +91 98258 63043",
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: TextStyle(
                                                                  fontSize: 7.sp),
                                                            )
                                                          ],
                                                        ),
                                                        SizedBox(width: 2.w),
                                                Spacer(),                                                      Row(
                                                          children: [
                                                            Image(
                                                                image: AssetImage(
                                                                    fb),
                                                                height: 14.sp),
                                                            Text(
                                                              "  રૂદ્ર ગૌ-સેવા મિત્ર મંડળ ટ્રસ્ટ",
                                                              textAlign: TextAlign
                                                                  .center,
                                                              style: TextStyle(
                                                                  fontSize: 7 .sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image(
                                                            image:
                                                                AssetImage(insta),
                                                            height: 14.sp),
                                                        Text(
                                                          "  રૂદ્ર ગૌ-સેવા મિત્ર મંડળ ટ્રસ્ટ",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 7.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 3.w),
                                              Container(
                                                // color: Colors.amberAccent,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: themeColor)),
                                                    height: 60.sp,
                                                    width: 60.sp,
                                                child:
                                                    Image(image: AssetImage(qr)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 10.h),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 2.sp, horizontal: 6.w),
                                          decoration: BoxDecoration(
                                              color: themeColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(6.sp),
                                                  topRight:
                                                      Radius.circular(6.sp))),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "BANK: HDFC ",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: secondaryColor),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(3.sp),
                                                margin: EdgeInsets.all(3.sp),
                                                color: secondaryColor,
                                                child: Text(
                                                  "A/C No : 50100611144937",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              Text(
                                                "IFSC : HDFC0001684",
                                                style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: secondaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(8.sp),
                                      decoration: BoxDecoration(
                                          color: themeColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10.sp),
                                              bottomRight:
                                                  Radius.circular(10.sp))),
                                      child: Text(
                                        "રૂદ્ર ગૌ-સેવા મિત્ર મંડળ ટ્રસ્ટ - સુરત",
                                        style: TextStyle(
                                            fontSize: 18.sp,
                                            color: secondaryColor),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (homeController.loading)
                      CustomLoader()
                    else if (homeController.checkForDownloadButton)
                      Positioned(
                        right: 10.w,
                        top: 45.h,
                        child: IconButton.filled(
                            onPressed: () async {
                              homeController.captureAndSavePng();
                            },
                            icon: Icon(Icons.download_for_offline_outlined)),
                      )
                  ],
                ),
              );
            }),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context, BirthdayManager homeController) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 100.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Gallery'),
                  onTap: () async {
                    print('Gallery tapped');
                    await homeController.getFromGallery(context);
                  },
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Camera'),
                  onTap: () async {
                    print('Camera tapped');
                    await homeController.getFromCamera(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
