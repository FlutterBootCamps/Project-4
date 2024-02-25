class Blog {
  Blog({
    required this.userID,
    required this.author,
    required this.title,
    required this.field,
    required this.summary,
    required this.content,
    required this.date,
    required this.readingMinutes,
    required this.userImg,
    required this.img,
  });
  late final int userID;
  late final String author;
  late final String title;
  late final String field;
  late final String summary;
  late final String content;
  late final String date;
  late final int readingMinutes;
  late final String userImg;
  late final String img;
  
  Blog.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['userID'] = userID;
    _data['author'] = author;
    _data['title'] = title;
    _data['field'] = field;
    _data['summary'] = summary;
    _data['content'] = content;
    _data['date'] = date;
    _data['readingMinutes'] = readingMinutes;
    _data['userImg'] = userImg;
    _data['img'] = img;
    return _data;
  }
}