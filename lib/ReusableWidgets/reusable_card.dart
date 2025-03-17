import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class ReusableCard extends StatelessWidget {
  VoidCallback onPress;
  final String imagePath;
  final String title;

  ReusableCard({
    super.key,
    required this.onPress,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height*1;
    double width=MediaQuery.of(context).size.width*1;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onPress,
      child: Container(
        height: height*.23,
        width: width*.43,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.5), // Shadow color
              spreadRadius: 3, // How much the shadow spreads
              blurRadius: 3, // Blur effect
              offset: Offset(4, 4), // Shadow position (X, Y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Image.asset(imagePath,height: 130,),
              SizedBox(height: 3,),
              Text(title,style: GoogleFonts.poppins(fontSize:15,color: AppColors.textColor,fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ),
    );
  }
}