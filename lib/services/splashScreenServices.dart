
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hadith_app/views/home_Screen.dart';

class SplashscreenServices{
   static void splashScreenService(BuildContext context)async {
    Timer(const Duration(seconds: 4), (){
      Get.off(const HomeScreen(),transition: Transition.circularReveal);
    });
  }
}