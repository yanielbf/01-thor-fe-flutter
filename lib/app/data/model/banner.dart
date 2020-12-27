import 'package:meta/meta.dart';

class BannerM {
  BannerM({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.linkType,
    @required this.linkResource,
  });

  int id;
  String title;
  String image;
  String linkType;
  String linkResource;

  factory BannerM.fromJson(Map<String, dynamic> json) => BannerM(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        linkType: json["link_type"],
        linkResource: json["link_resource"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "link_type": linkType,
        "link_resource": linkResource,
      };
}
