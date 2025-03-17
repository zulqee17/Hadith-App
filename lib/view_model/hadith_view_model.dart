
import 'package:hadith_app/model/hadith_model.dart';
import 'package:hadith_app/repository/hadith_repository.dart';

import '../model/random_hadith_model.dart';

class HadithViewModel{

  final _repo=HadithRepository();
  Future<HadithModel> fetchHadithData(String bookName)async{
    final response=await _repo.fetchHadithData(bookName);
    return response;
  }

  Future<RandomHadithModel> fetchRandomHadithData()async{
    final response=await _repo.fetchRandomHadithData();
    return response;
  }

}