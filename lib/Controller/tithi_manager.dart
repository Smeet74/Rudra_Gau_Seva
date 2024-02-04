import 'dart:io';
import 'dart:typed_data';
import 'package:birthday_post/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

class TithiManager extends GetxController {
  final BuildContext context;
  TithiManager({required this.context});
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  bool loader = false;
  bool _checkForDownloadButton = false;
  File? selectedImage;
  DateTime selectedDate = DateTime.now();
  late String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
  late String dayName = DateFormat('EEEE').format(selectedDate);

  DateTime svaSelectedDate = DateTime.now();
  late String svaFormattedDate =
      DateFormat('dd/MM/yyyy').format(svaSelectedDate);

  GlobalKey globalKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();
  FToast fToast = FToast();
  bool _loading = false;
  bool get loading => _loading;
  bool get checkForDownloadButton => _checkForDownloadButton;

  @override
  void onInit() {
    super.onInit();
    dateConvertGujarati();
    dayName = getDayNameInGujarati(dayName);
    fToast.init(context);
  }

  getFromGallery(ctx) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage = File(image.path);
      update();
    }
    Navigator.pop(ctx);
  }

  getFromCamera(ctx) async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      selectedImage = File(photo.path);
      update();
    }
    Navigator.pop(ctx);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      dayName = DateFormat('EEEE').format(selectedDate);
      dateConvertGujarati();
      dayName = getDayNameInGujarati(dayName);
      update();
    }
  }

  Future<void> selectTithiDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != svaSelectedDate) {
      svaSelectedDate = picked;
      svaFormattedDate = DateFormat('dd/MM/yyyy').format(svaSelectedDate);
      dateConvertGujarati();
      update();
    }
  }

  checkInputFields() {
    _checkForDownloadButton =
        nameController.text.isNotEmpty && amountController.text.isNotEmpty;
    update();
  }

  dateConvertGujarati() {
    StringBuffer sb = StringBuffer();
    for (var char in formattedDate.split('')) {
      if (char.contains(RegExp(r'\d'))) {
        sb.write(toGujarati(int.parse(char)));
      } else {
        sb.write(char);
      }
    }
    formattedDate = sb.toString();
    update();

    StringBuffer sb1 = StringBuffer();
    for (var char in svaFormattedDate.split('')) {
      if (char.contains(RegExp(r'\d'))) {
        sb1.write(toGujarati(int.parse(char)));
      } else {
        sb1.write(char);
      }
    }
    svaFormattedDate = sb1.toString();
    update();
  }

  String toGujarati(int num) {
    switch (num) {
      case 0:
        return '૦';
      case 1:
        return '૧';
      case 2:
        return '૨';
      case 3:
        return '૩';
      case 4:
        return '૪';
      case 5:
        return '૫';
      case 6:
        return '૬';
      case 7:
        return '૭';
      case 8:
        return '૮';
      case 9:
        return '૯';
      default:
        return '';
    }
  }

  String getDayNameInGujarati(String dayName) {
    switch (dayName) {
      case 'Monday':
        return 'સોમવાર';
      case 'Tuesday':
        return 'મંગળવાર';
      case 'Wednesday':
        return 'બુધવાર';
      case 'Thursday':
        return 'ગુરુવાર';
      case 'Friday':
        return 'શુક્રવાર';
      case 'Saturday':
        return 'શનિવાર';
      case 'Sunday':
        return 'રવિવાર';
      default:
        return 'Invalid Day Name';
    }
  }

  setLoading(bool loading) {
    _loading = loading;
    update();
  }

  captureAndSavePng() async {
    FocusManager.instance.primaryFocus?.unfocus();

    setLoading(true);
    screenshotController.capture().then((Uint8List? image) async {
      if (image != null) {
        await ImageGallerySaver.saveImage(image);
        showToast("Post saved to gallery");
        setLoading(false);
      }
    }).catchError((onError) {
      showToast(onError.toString());
      setLoading(false);
    });
  }

  void showToast(msg) {
    fToast.showToast(
        toastDuration: const Duration(seconds: 3),
        gravity: ToastGravity.BOTTOM,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10.sp,
            ),
            color: Colors.green[300],
          ),
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                image: AssetImage(download),
                width: 25.sp,
                height: 25.sp,
              ),
              SizedBox(width: 5.w),
              Text(msg, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ));
  }
}
