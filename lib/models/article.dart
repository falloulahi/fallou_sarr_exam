// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  String? by;
  int? score;
  String? title;
  String? url;

  ArticleModel({
    this.by,
    this.score,
    this.title,
    this.url,
  });

  ArticleModel.fromJson(Map<String, dynamic> json){
    by = json['by'];
    score = json['score'];
    title = json['title'];
    url = json['url'];
  }
}
