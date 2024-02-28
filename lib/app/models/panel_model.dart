import 'dart:convert';

List<Panels> panelsFromJson(String str) =>
    List<Panels>.from(json.decode(str).map((x) => Panels.fromJson(x)));

String panelsToJson(List<Panels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Panels {
  final int? id;
  final String? uid;
  final String? title;
  final String? uri;
  final String? url;
  final String? slug;
  final String? type;
  final List<dynamic>? tags;
  final bool? isStarred;
  final int? sortMeta;

  Panels({
    this.id,
    this.uid,
    this.title,
    this.uri,
    this.url,
    this.slug,
    this.type,
    this.tags,
    this.isStarred,
    this.sortMeta,
  });

  factory Panels.fromJson(Map<String, dynamic> json) => Panels(
        id: json["id"],
        uid: json["uid"],
        title: json["title"],
        uri: json["uri"],
        url: json["url"],
        slug: json["slug"],
        type: json["type"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        isStarred: json["isStarred"],
        sortMeta: json["sortMeta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "title": title,
        "uri": uri,
        "url": url,
        "slug": slug,
        "type": type,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "isStarred": isStarred,
        "sortMeta": sortMeta,
      };
}
