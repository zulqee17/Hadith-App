import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith_app/constants/app_colors.dart';
import 'package:hadith_app/views/hadith_chapter_screen.dart';
import 'package:hadith_app/views/random_hadith_screen.dart';
import '../ReusableWidgets/reusable_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height*1;
    double width=MediaQuery.of(context).size.width*1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secoundryColor,
        title: Text('Hadith Collection',style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Assalamu Alaikum',style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.w600),),
              Text('Welcome to the Hadith App',style: GoogleFonts.poppins(fontSize: 15,color: Colors.grey.shade700),),
              SizedBox(
                height: height*.02,
              ),
              InkWell(
                onTap: (){
                  Get.to(const RandomHadithScreen());
                },
                child: Center(
                  child: Container(
                    height: height*.2,
                    width: width*.9,
                    decoration:const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomLeft: Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Random Hadith',style: GoogleFonts.poppins(fontSize:15,color: AppColors.textColor,fontWeight: FontWeight.w600)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Icon(Icons.menu_book_outlined,color: AppColors.secoundryColor,),
                                  SizedBox(width: width*.015,),
                                  Text('Bukhari',style: GoogleFonts.poppins(color: AppColors.textColor,fontWeight: FontWeight.w600))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:50),
                          child: Image.asset('assets/images/openBook.png',height: 160,width: 160,),
                        )

                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: height*.02,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Sahih Bukhari',bookName: 'sahih-bukhari',));
                    },
                    imagePath: 'assets/images/SahihBukhari.png',
                    title: 'Sahih Bukhari',
                  ),
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Sahih Muslim',bookName: 'sahih-muslim',));
                    },
                    imagePath: 'assets/images/SahihMuslim.webp',
                    title: 'Sahih Muslim',
                  ),
                ],
              ),
              SizedBox(height: height*.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Jami Al-Tirmidhi',bookName: 'al-tirmidhi',));
                    },
                    imagePath: 'assets/images/JamiAlTirmidhi.png',
                    title: 'Jami Al-Tirmidhi',
                  ),
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Sunan Abu Dawood',bookName: 'abu-dawood',));
                    },
                    imagePath: 'assets/images/SunanAbiDawood.png',
                    title: 'Sunan Abu Dawood',
                  ),
                ],
              ),
              SizedBox(height: height*.02,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Sunan Ibn Majah',bookName: 'ibn-e-majah',));
                    },
                    imagePath: 'assets/images/SunanIbnMajah.png',
                    title: 'Sunan Ibn Majah',),
                  ReusableCard(
                    onPress: (){
                      Get.to(HadithChapterScreen(title: 'Sunan An Nasai',bookName: 'sunan-nasai',));
                    },
                    imagePath: 'assets/images/SunanAnNasai.png',
                    title: 'Sunan An Nasai',),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


