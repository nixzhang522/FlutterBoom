// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) {
  return Course(
      json['id'] as int,
      json['episode_cnt'] as int,
      json['subscribed'] as bool,
      json['pricing'] == null
          ? null
          : Pricing.fromJson(json['pricing'] as Map<String, dynamic>),
      json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['last_scene_parent'] as int,
      json['name_zh'] as String,
      json['name_en'] as String,
      json['tagline'] as String,
      json['description'] as String,
      json['banner_image'] as String,
      json['list_image'] as String,
      json['main_image'] as String,
      json['main_video'] as String,
      json['difficulty'] as int,
      json['user_id'] as String,
      json['is_home'] as bool,
      json['is_complete'] as bool,
      json['scenario_type'] as String,
      json['target_audience'] as String,
      (json['five_star_rating_commission_rate'] as num)?.toDouble(),
      (json['course_purchase_commission_rate'] as num)?.toDouble(),
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['sortorder'] as int,
      json['is_enabled'] as bool,
      json['categories'] as List)
    ..sceneParents = (json['scene_parents'] as List)
        ?.map((e) => e == null
            ? null
            : SceneParentClass.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'id': instance.id,
      'episode_cnt': instance.episodeCnt,
      'subscribed': instance.subscribed,
      'pricing': instance.pricing,
      'user': instance.user,
      'tags': instance.tags,
      'scene_parents': instance.sceneParents,
      'last_scene_parent': instance.lastSceneParent,
      'name_zh': instance.nameZh,
      'name_en': instance.nameEn,
      'tagline': instance.tagline,
      'description': instance.description,
      'banner_image': instance.bannerImage,
      'list_image': instance.listImage,
      'main_image': instance.mainImage,
      'main_video': instance.mainVideo,
      'difficulty': instance.difficulty,
      'user_id': instance.userId,
      'is_home': instance.isHome,
      'is_complete': instance.isComplete,
      'scenario_type': instance.scenarioType,
      'target_audience': instance.targetAudience,
      'five_star_rating_commission_rate': instance.fiveStarRatingCommissionRate,
      'course_purchase_commission_rate': instance.coursePurchaseCommissionRate,
      'meta': instance.meta,
      'sortorder': instance.sortorder,
      'is_enabled': instance.isEnabled,
      'categories': instance.categories
    };

SceneParentClass _$SceneParentClassFromJson(Map<String, dynamic> json) {
  return SceneParentClass(
      json['type_name'] as String,
      json['default'] as bool,
      (json['scene_parents'] as List)
          ?.map((e) => e == null
              ? null
              : SceneParent.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$SceneParentClassToJson(SceneParentClass instance) =>
    <String, dynamic>{
      'type_name': instance.typeName,
      'default': instance.isDefault,
      'scene_parents': instance.sceneParents
    };

SceneParent _$SceneParentFromJson(Map<String, dynamic> json) {
  return SceneParent(
      json['id'] as int,
      json['course_name'] as String,
      (json['main_and_minor_scenes'] as List)
          ?.map((e) =>
              e == null ? null : Scene.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['created_ts'] as num)?.toDouble(),
      json['type'] as String,
      json['name_zh'] as String,
      json['name_en'] as String,
      json['list_image'] as String,
      json['comment_cnt'] as int,
      json['sortorder'] as int,
      json['is_enabled'] as bool,
      json['is_trial'] as bool,
      json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
      json['scenario'] as int)
    ..tagline = json['tagline'] as String;
}

Map<String, dynamic> _$SceneParentToJson(SceneParent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_name': instance.courseName,
      'main_and_minor_scenes': instance.mainAndMinorScenes,
      'created_ts': instance.createdTs,
      'type': instance.type,
      'name_zh': instance.nameZh,
      'name_en': instance.nameEn,
      'list_image': instance.listImage,
      'tagline': instance.tagline,
      'comment_cnt': instance.commentCnt,
      'sortorder': instance.sortorder,
      'is_enabled': instance.isEnabled,
      'is_trial': instance.isTrial,
      'meta': instance.meta,
      'scenario': instance.scenario
    };

Scene _$SceneFromJson(Map<String, dynamic> json) {
  return Scene(
      json['id'] as int,
      json['name'] as String,
      json['scene_type'] as String,
      json['tagline'] as String,
      (json['video_content_duration'] as num)?.toDouble(),
      json['practices'] as List);
}

Map<String, dynamic> _$SceneToJson(Scene instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'scene_type': instance.sceneType,
      'tagline': instance.tagline,
      'video_content_duration': instance.videoContentDuration,
      'practices': instance.practices
    };

Pricing _$PricingFromJson(Map<String, dynamic> json) {
  return Pricing(
      json['id'] as String,
      json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      json['certificates_used'] as List,
      (json['savings'] as num)?.toDouble(),
      (json['boomcoin_discount'] as num)?.toDouble(),
      (json['total'] as num)?.toDouble(),
      json['qty'] as int,
      json['is_prize'] as bool);
}

Map<String, dynamic> _$PricingToJson(Pricing instance) => <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'certificates_used': instance.certificatesUsed,
      'savings': instance.savings,
      'boomcoin_discount': instance.boomcoinDiscount,
      'total': instance.total,
      'qty': instance.qty,
      'is_prize': instance.isPrize
    };

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
      json['id'] as int,
      json['boom_id'] as String,
      json['product_sku'] as String,
      json['name'] as String,
      json['name_select'] as String,
      json['list_image'] as String,
      json['description'] as String,
      json['qty'] as int,
      (json['price'] as num)?.toDouble(),
      (json['sales_price'] as num)?.toDouble(),
      (json['shipping'] as num)?.toDouble(),
      json['is_drawable'] as bool,
      json['display_draw_odds'] as int,
      json['draw_odds'] as int,
      json['is_prize'] as bool,
      json['is_certificate'] as bool,
      (json['max_boomcoin_discount_pct'] as num)?.toDouble(),
      json['is_enabled'] as bool,
      json['is_virtual'] as bool,
      json['certificate_products'] as List,
      (json['listings'] as List)?.map((e) => e as int)?.toList());
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'boom_id': instance.boomId,
      'product_sku': instance.productSku,
      'name': instance.name,
      'name_select': instance.nameSelect,
      'list_image': instance.listImage,
      'description': instance.description,
      'qty': instance.qty,
      'price': instance.price,
      'sales_price': instance.salesPrice,
      'shipping': instance.shipping,
      'is_drawable': instance.isDrawable,
      'display_draw_odds': instance.displayDrawOdds,
      'draw_odds': instance.drawOdds,
      'is_prize': instance.isPrize,
      'is_certificate': instance.isCertificate,
      'max_boomcoin_discount_pct': instance.maxBoomcoinDiscountPct,
      'is_enabled': instance.isEnabled,
      'is_virtual': instance.isVirtual,
      'certificate_products': instance.certificateProducts,
      'listings': instance.listings
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['boom_id'] as String,
      json['nickname'] as String,
      json['role'] as String,
      json['is_boom_vip'] as bool,
      json['level'] as int,
      json['age'] as int,
      json['avatar'] as String,
      json['is_following'] as bool,
      json['phone'] as String,
      json['signature'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'boom_id': instance.boomId,
      'nickname': instance.nickname,
      'role': instance.role,
      'is_boom_vip': instance.isBoomVip,
      'level': instance.level,
      'age': instance.age,
      'avatar': instance.avatar,
      'is_following': instance.isFollowing,
      'phone': instance.phone,
      'signature': instance.signature
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(
      json['id'] as int,
      json['name_en'] as String,
      json['name_zh'] as String,
      json['sortorder'] as int,
      json['is_enabled'] as bool);
}

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_zh': instance.nameZh,
      'sortorder': instance.sortorder,
      'is_enabled': instance.isEnabled
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta();
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{};
