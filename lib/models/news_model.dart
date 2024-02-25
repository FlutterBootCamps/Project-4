class NewsModel {
  int? userID;
  String? author;
  String? title;
  String? field;
  String? summary;
  String? content;
  String? date;
  int? readingMinutes;
  String? userImg;
  String? img;

  NewsModel(
      {this.userID,
      this.author,
      this.title,
      this.field,
      this.summary,
      this.content,
      this.date,
      this.readingMinutes,
      this.userImg,
      this.img});

  NewsModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    author = json['author'];
    title = json['title'];
    field = json['field'];
    summary = json['summary'];
    content = json['content'];
    date = json['date'];
    readingMinutes = json['readingMinutes'];
    userImg = json['userImg'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userID'] = this.userID;
    data['author'] = this.author;
    data['title'] = this.title;
    data['field'] = this.field;
    data['summary'] = this.summary;
    data['content'] = this.content;
    data['date'] = this.date;
    data['readingMinutes'] = this.readingMinutes;
    data['userImg'] = this.userImg;
    data['img'] = this.img;
    return data;
  }
}
