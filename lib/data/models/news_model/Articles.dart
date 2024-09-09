import 'Source.dart';

/// source : {"id":null,"name":"BBC News"}
/// author : null
/// title : "Joey Barton trial date set over malicious posts"
/// description : "The ex-footballer denies sending malicious communications to football pundit Eni Aluko."
/// url : "https://www.bbc.com/news/articles/ce31w676wpeo"
/// urlToImage : "https://ichef.bbci.co.uk/news/1024/branded_news/4a85/live/68a7f450-6455-11ef-91f3-273f9f80a920.jpg"
/// publishedAt : "2024-08-27T10:36:13Z"
/// content : "A trial date has been set for ex-footballer Joey Barton, who is accused of sending malicious communications to football pundit Eni Aluko.\r\nMr Barton, 41, pleaded not guilty at Liverpool Crown Court t… [+1049 chars]"

class Articles {
  Articles({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Articles.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  dynamic author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}