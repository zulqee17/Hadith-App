import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:hadith_app/model/random_hadith_model.dart';
import 'package:hadith_app/view_model/hadith_view_model.dart';


import '../constants/app_colors.dart';

class RandomHadithScreen extends StatefulWidget {
  const RandomHadithScreen({super.key});

  @override
  State<RandomHadithScreen> createState() => _RandomHadithScreenState();
}

class _RandomHadithScreenState extends State<RandomHadithScreen> {
  final HadithViewModel _hadithViewModel = HadithViewModel();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.secoundryColor,
          centerTitle: true,
          title: Text('Sahih Bukhari',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<RandomHadithModel>(
                      future: _hadithViewModel.fetchRandomHadithData(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(
                              child: SpinKitThreeBounce(
                            size: 50,
                            color: AppColors.primaryColor,
                          ));
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              "Error Occurred While Fetching Data!...",
                              style: GoogleFonts.poppins(
                                  fontSize: 17, color: Colors.black),
                            ),
                          );
                        } else {
                          var hadithData = snapshot.data!;

                          String book = hadithData.data!.book.toString();
                          String chapterName =
                              hadithData.data!.chapterName.toString();
                          String header = hadithData.data!.header.toString();
                          String hadithEnglish =
                              hadithData.data!.hadithEnglish.toString();
                          String refNo = hadithData.data!.refno.toString();



                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.cardColor,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius:
                                          6, // How much the shadow spreads
                                      blurRadius: 9, // Blur effect
                                      offset: const Offset(
                                          0, 0), // Shadow position (X, Y)
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '📖 $book',
                                        style: GoogleFonts.poppins(
                                            color: AppColors.primaryColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '📌$chapterName ($refNo)',
                                        textAlign: TextAlign.justify,
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                        header,
                                        style: GoogleFonts.poppins(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade600,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        hadithEnglish,
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // SizedBox(
                              //   height: height * .03,
                              // ),
                              // Center(
                              //   child: InkWell(
                              //     onTap: () {
                              //     },
                              //     child: Container(
                              //       height: 45,
                              //       width: 200,
                              //       decoration: BoxDecoration(
                              //           color: AppColors.primaryColor,
                              //           borderRadius: BorderRadius.circular(30)),
                              //       child: Row(
                              //         mainAxisAlignment: MainAxisAlignment.center,
                              //         children: [
                              //           const Icon(
                              //             Icons.share,
                              //             color: AppColors.secoundryColor,
                              //           ),
                              //           const SizedBox(
                              //             width: 5,
                              //           ),
                              //           Text('Share Hadith',
                              //               style: GoogleFonts.poppins(
                              //                   fontSize: 15,
                              //                   color: AppColors.secoundryColor,
                              //                   fontWeight: FontWeight.bold,
                              //                   letterSpacing: 2))
                              //         ],
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          );
                        }
                      }),
                ),
              ),
            ),
          ],
        ));
  }
}
