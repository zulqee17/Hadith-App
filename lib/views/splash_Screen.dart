import 'package:flutter/material.dart';
import 'package:hadith_app/constants/app_colors.dart';
import 'package:hadith_app/services/splashScreenServices.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashscreenServices.splashScreenService(context);
  }
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height*1;
    // double width=MediaQuery.of(context).size.width*1;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Lottie.asset(
          height: height*.3,
            // repeat: true,
            'assets/animations/bismillahAnimation.json'
        ),
      )
    );
  }
}
