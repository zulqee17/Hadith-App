import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith_app/model/hadith_model.dart';
import 'package:hadith_app/view_model/hadith_view_model.dart';
import 'package:hadith_app/views/hadith_detail_screen.dart';


import '../constants/app_colors.dart';

class HadithChapterScreen extends StatefulWidget {
  String title;
  String bookName;
  HadithChapterScreen({super.key,required this.title,required this.bookName});

  @override
  State<HadithChapterScreen> createState() => _HadithChapterScreenState();
}

class _HadithChapterScreenState extends State<HadithChapterScreen> {
  final HadithViewModel _hadithViewModel=HadithViewModel();
  TextEditingController searchController=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.secoundryColor,
        centerTitle: true,
        title: Text(widget.title,style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5,left: 5,right: 5),
              child: TextFormField(
                onChanged: (value){
                  setState(() {});
                },
                controller: searchController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'enter hadith number, i.e 12',
                    prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                      width: 1
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: AppColors.primaryColor,
                        width: 2
                      )
                  )
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<HadithModel>(
                    future: _hadithViewModel.fetchHadithData(widget.bookName),
                    builder: (BuildContext context, snapshot){
                      if(snapshot.connectionState==ConnectionState.waiting){
                        return const Center(
                          child:SpinKitThreeBounce(
                            size: 50,
                            color: AppColors.primaryColor,
                          )
                        );
                      }else if(snapshot.hasError){
                        return Center(
                          child: Text("Error Occurred While Fetching Data!...",style: GoogleFonts.poppins(fontSize: 17,color: Colors.black),),
                        );
                      }else{
                        return ListView.builder(
                           itemCount: snapshot.data!.hadiths!.data!.length,
                           itemBuilder: (context,index){
                           String hadithNumber=snapshot.data!.hadiths!.data![index].hadithNumber.toString();
                           String chapterId=snapshot.data!.hadiths!.data![index].chapterId.toString();
                           String chapterEnglish=snapshot.data!.hadiths!.data![index].chapter!.chapterEnglish.toString();
                           String chapterUrdu=snapshot.data!.hadiths!.data![index].chapter!.chapterUrdu.toString();

                           String appBarTitle=widget.title;
                           String writerName=snapshot.data!.hadiths!.data![index].book!.writerName.toString();
                           String headingUrdu=snapshot.data!.hadiths!.data![index].headingUrdu.toString();
                           String headingEnglish=snapshot.data!.hadiths!.data![index].headingEnglish.toString();
                           String hadithUrdu=snapshot.data!.hadiths!.data![index].hadithUrdu.toString();
                           String hadithEnglish=snapshot.data!.hadiths!.data![index].hadithEnglish.toString();

                           if(searchController.text.isEmpty || hadithNumber.toLowerCase().contains(searchController.text.toLowerCase())){
                             return Padding(
                               padding: const EdgeInsets.symmetric(vertical: 3),
                               child: GestureDetector(
                                 onTap: (){
                                   Get.to(HadithDetailScreen(
                                       appBarTitle: appBarTitle,
                                       chapterUrdu: chapterUrdu,
                                       chapterEnglish: chapterEnglish,
                                       writerName: writerName,
                                       hadithNumber: hadithNumber,
                                       headingUrdu: headingUrdu,
                                       headingEnglish: headingEnglish,
                                       hadithUrdu: hadithUrdu,
                                       hadithEnglish: hadithEnglish));
                                   searchController.clear();
                                 },
                                 child: Card(
                                   elevation: 2,
                                   color: AppColors.cardColor,
                                   child: ListTile(
                                     leading: CircleAvatar(
                                       backgroundColor: AppColors.primaryColor,
                                       child: Center(child: Text(hadithNumber,style: const TextStyle(color: AppColors.textColor,fontWeight: FontWeight.bold),)),
                                     ),
                                     title: Text("Chapter $chapterId \n$chapterEnglish",style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
                                     subtitle: Text(chapterUrdu,style: GoogleFonts.poppins(fontWeight: FontWeight.bold),),
                                   ),
                                 ),
                               ),
                             );
                           }else{
                             return const SizedBox();
                           }
                        }
                        );
                      }
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
