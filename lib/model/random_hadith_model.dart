class RandomHadithModel {
  Data? data;

  RandomHadithModel({this.data});

  RandomHadithModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? book;
  String? bookName;
  String? chapterName;
  String? hadithEnglish;
  String? header;
  int? id;
  String? refno;

  Data(
      {this.book,
      this.bookName,
      this.chapterName,
      this.hadithEnglish,
      this.header,
      this.id,
      this.refno});

  Data.fromJson(Map<String, dynamic> json) {
    book = json['book'];
    bookName = json['bookName'];
    chapterName = json['chapterName'];
    hadithEnglish = json['hadith_english'];
    header = json['header'];
    id = json['id'];
    refno = json['refno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['book'] = this.book;
    data['bookName'] = this.bookName;
    data['chapterName'] = this.chapterName;
    data['hadith_english'] = this.hadithEnglish;
    data['header'] = this.header;
    data['id'] = this.id;
    data['refno'] = this.refno;
    return data;
  }
}
