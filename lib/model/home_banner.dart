import 'package:json_annotation/json_annotation.dart';

part 'home_banner.g.dart';

List<HomeBanner> getHomeBannerList(List<dynamic> list) {
  List<HomeBanner> result = [];
  list.forEach((item) {
    result.add(HomeBanner.fromJson(item));
  });
  return result;
}

@JsonSerializable()
class HomeBanner extends Object {
  @JsonKey(name: 'list_image')
  String listImage;

  @JsonKey(name: 'action')
  String action;

  @JsonKey(name: 'meta')
  Meta meta;

  @JsonKey(name: 'sortorder')
  int sortorder;

  HomeBanner(
    this.listImage,
    this.action,
    this.meta,
    this.sortorder,
  );

  factory HomeBanner.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerFromJson(srcJson);
}

@JsonSerializable()
class Meta extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'image')
  String image;

  Meta(
    this.id,
    this.name,
    this.image,
  );

  factory Meta.fromJson(Map<String, dynamic> srcJson) =>
      _$MetaFromJson(srcJson);
}
