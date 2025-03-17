import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith_app/constants/app_colors.dart';


class HadithDetailScreen extends StatefulWidget {
  String appBarTitle;
  String chapterUrdu;
  String chapterEnglish;
  String writerName;
  String hadithNumber;
  String headingUrdu;
  String headingEnglish;
  String hadithUrdu;
  String hadithEnglish;

  HadithDetailScreen({
    super.key,
    required this.appBarTitle,
    required this.chapterUrdu,
    required this.chapterEnglish,
    required this.writerName,
    required this.hadithNumber,
    required this.headingUrdu,
    required this.headingEnglish,
    required this.hadithUrdu,
    required this.hadithEnglish,
  });

  @override
  State<HadithDetailScreen> createState() => _HadithDetailScreenState();
}

class _HadithDetailScreenState extends State<HadithDetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height*1;
    // double width=MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.appBarTitle,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secoundryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            SizedBox(height: height*.01,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 6, // How much the shadow spreads
                    blurRadius: 9, // Blur effect
                    offset: const Offset(0, 0), // Shadow position (X, Y)
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('باب: ${widget.chapterUrdu}',style: GoogleFonts.poppins(color: AppColors.primaryColor,fontSize: 23,fontWeight: FontWeight.bold),),
                    Text('Chapter: ${widget.chapterEnglish}',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600),),
                    const Divider(thickness: 2,),
                    Text('Narrated by: ${widget.writerName}',style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.grey.shade600,fontStyle: FontStyle.italic),),
        
                  ],
                ),
              ),
            ),
            SizedBox(height: height*.03,),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 6, // How much the shadow spreads
                    blurRadius: 9, // Blur effect
                    offset: const Offset(0, 0), // Shadow position (X, Y)
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('حدیث نمبر: ${widget.hadithNumber}',style: GoogleFonts.poppins(color: AppColors.primaryColor,fontSize: 25,fontWeight: FontWeight.bold),),
                    Text(widget.headingUrdu,textAlign: TextAlign.end,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,),),
                    const SizedBox(height: 5,),
                    Text(widget.headingEnglish,style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w600,color: Colors.grey.shade600),),
                    const Divider(thickness: 2,),
                    Text(widget.hadithUrdu,textAlign: TextAlign.end,style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600,),),
                    const SizedBox(height: 5,),
                    Text(widget.hadithEnglish,style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),
            ),
            // SizedBox(height: height*.03,),
            // InkWell(
            //   onTap: (){
            //
            //   },
            //   child: Container(
            //     height: 45,
            //     width: 200,
            //     decoration: BoxDecoration(
            //       color: AppColors.primaryColor,
            //       borderRadius: BorderRadius.circular(30)
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Icon(Icons.share,color: AppColors.secoundryColor,),
            //         const SizedBox(width: 5,),
            //         Text('Share Hadith',style: GoogleFonts.poppins(fontSize: 15,color: AppColors.secoundryColor,fontWeight: FontWeight.bold,letterSpacing: 2))
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(height: height*.02,),
          ],
        ),
        ),
      ),
    );
  }
}
