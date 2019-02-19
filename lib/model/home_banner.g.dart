// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBanner _$HomeBannerFromJson(Map<String, dynamic> json) {
  return HomeBanner(
      json['list_image'] as String,
      json['action'] as String,
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['sortorder'] as int);
}

Map<String, dynamic> _$HomeBannerToJson(HomeBanner instance) =>
    <String, dynamic>{
      'list_image': instance.listImage,
      'action': instance.action,
      'meta': instance.meta,
      'sortorder': instance.sortorder
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
      json['id'] as String, json['name'] as String, json['image'] as String);
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image
    };
