
import 'dart:convert';

import '../model/hadith_model.dart';
import 'package:http/http.dart' as http;

import '../model/random_hadith_model.dart';

class HadithRepository{


Future<HadithModel> fetchHadithData(String bookName)async{
  String url="https://hadithapi.com/api/hadiths?apiKey=\$2y\$10\$1k53qGpnMZ7Rq949Quu8bJSiq590CIQMiAB8WpAV0XF8oqt3&book=$bookName&paginate=100";
  final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
  print(response.body);
  if(response.statusCode==200){
    final body=jsonDecode(response.body.toString());
    return HadithModel.fromJson(body);
  }else{
    throw Exception('error while fetching data');
  }
}

Future<RandomHadithModel> fetchRandomHadithData()async{
  String url ="https://random-hadith-generator.vercel.app/bukhari/";
  final response=await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
  if(response.statusCode==200){
    final body =jsonDecode(response.body.toString());
    return RandomHadithModel.fromJson(body);
  }else{
    throw Exception('error while fetching data');
  }
}
}