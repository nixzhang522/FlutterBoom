import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'episode_cnt')
  int episodeCnt;

  @JsonKey(name: 'subscribed')
  bool subscribed;

  @JsonKey(name: 'pricing')
  Pricing pricing;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'scene_parents')
  List<SceneParentClass> sceneParents;

  @JsonKey(name: 'last_scene_parent')
  int lastSceneParent;

  @JsonKey(name: 'name_zh')
  String nameZh;

  @JsonKey(name: 'name_en')
  String nameEn;

  @JsonKey(name: 'tagline')
  String tagline;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'banner_image')
  String bannerImage;

  @JsonKey(name: 'list_image')
  String listImage;

  @JsonKey(name: 'main_image')
  String mainImage;

  @JsonKey(name: 'main_video')
  String mainVideo;

  @JsonKey(name: 'difficulty')
  int difficulty;

  @JsonKey(name: 'user_id')
  String userId;

  @JsonKey(name: 'is_home')
  bool isHome;

  @JsonKey(name: 'is_complete')
  bool isComplete;

  @JsonKey(name: 'scenario_type')
  String scenarioType;

  @JsonKey(name: 'target_audience')
  String targetAudience;

  @JsonKey(name: 'five_star_rating_commission_rate')
  double fiveStarRatingCommissionRate;

  @JsonKey(name: 'course_purchase_commission_rate')
  double coursePurchaseCommissionRate;

  @JsonKey(name: 'meta')
  Meta meta;

  @JsonKey(name: 'sortorder')
  int sortorder;

  @JsonKey(name: 'is_enabled')
  bool isEnabled;

  @JsonKey(name: 'categories')
  List<dynamic> categories;

  Course(
    this.id,
    this.episodeCnt,
    this.subscribed,
    this.pricing,
    this.user,
    this.tags,
    this.lastSceneParent,
    this.nameZh,
    this.nameEn,
    this.tagline,
    this.description,
    this.bannerImage,
    this.listImage,
    this.mainImage,
    this.mainVideo,
    this.difficulty,
    this.userId,
    this.isHome,
    this.isComplete,
    this.scenarioType,
    this.targetAudience,
    this.fiveStarRatingCommissionRate,
    this.coursePurchaseCommissionRate,
    this.meta,
    this.sortorder,
    this.isEnabled,
    this.categories,
  );

  factory Course.fromJson(Map<String, dynamic> srcJson) =>
      _$CourseFromJson(srcJson);
}

@JsonSerializable()
class SceneParentClass extends Object {
  @JsonKey(name: 'type_name')
  String typeName;

  @JsonKey(name: 'default')
  bool isDefault;

  @JsonKey(name: 'scene_parents')
  List<SceneParent> sceneParents;

  SceneParentClass(
    this.typeName,
    this.isDefault,
    this.sceneParents,
  );

  factory SceneParentClass.fromJson(Map<String, dynamic> srcJson) =>
      _$SceneParentClassFromJson(srcJson);
}

@JsonSerializable()
class SceneParent extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'course_name')
  String courseName;

  @JsonKey(name: 'main_and_minor_scenes')
  List<Scene> mainAndMinorScenes;

  @JsonKey(name: 'created_ts')
  double createdTs;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'name_zh')
  String nameZh;

  @JsonKey(name: 'name_en')
  String nameEn;

  @JsonKey(name: 'list_image')
  String listImage;

  @JsonKey(name: 'tagline')
  String tagline;

  @JsonKey(name: 'comment_cnt')
  int commentCnt;

  @JsonKey(name: 'sortorder')
  int sortorder;

  @JsonKey(name: 'is_enabled')
  bool isEnabled;

  @JsonKey(name: 'is_trial')
  bool isTrial;

  @JsonKey(name: 'meta')
  Meta meta;

  @JsonKey(name: 'scenario')
  int scenario;

  SceneParent(
    this.id,
    this.courseName,
    this.mainAndMinorScenes,
    this.createdTs,
    this.type,
    this.nameZh,
    this.nameEn,
    this.listImage,
    this.commentCnt,
    this.sortorder,
    this.isEnabled,
    this.isTrial,
    this.meta,
    this.scenario,
  );

  factory SceneParent.fromJson(Map<String, dynamic> srcJson) =>
      _$SceneParentFromJson(srcJson);
}

@JsonSerializable()
class Scene extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'scene_type')
  String sceneType;

  @JsonKey(name: 'tagline')
  String tagline;

  @JsonKey(name: 'video_content_duration')
  double videoContentDuration;

  @JsonKey(name: 'practices')
  List<dynamic> practices;

  Scene(
    this.id,
    this.name,
    this.sceneType,
    this.tagline,
    this.videoContentDuration,
    this.practices,
  );

  factory Scene.fromJson(Map<String, dynamic> srcJson) =>
      _$SceneFromJson(srcJson);
}

@JsonSerializable()
class Pricing extends Object {
  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'product')
  Product product;

  @JsonKey(name: 'certificates_used')
  List<dynamic> certificatesUsed;

  @JsonKey(name: 'savings')
  double savings;

  @JsonKey(name: 'boomcoin_discount')
  double boomcoinDiscount;

  @JsonKey(name: 'total')
  double total;

  @JsonKey(name: 'qty')
  int qty;

  @JsonKey(name: 'is_prize')
  bool isPrize;

  Pricing(
    this.id,
    this.product,
    this.certificatesUsed,
    this.savings,
    this.boomcoinDiscount,
    this.total,
    this.qty,
    this.isPrize,
  );

  factory Pricing.fromJson(Map<String, dynamic> srcJson) =>
      _$PricingFromJson(srcJson);
}

@JsonSerializable()
class Product extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'boom_id')
  String boomId;

  @JsonKey(name: 'product_sku')
  String productSku;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'name_select')
  String nameSelect;

  @JsonKey(name: 'list_image')
  String listImage;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'qty')
  int qty;

  @JsonKey(name: 'price')
  double price;

  @JsonKey(name: 'sales_price')
  double salesPrice;

  @JsonKey(name: 'shipping')
  double shipping;

  @JsonKey(name: 'is_drawable')
  bool isDrawable;

  @JsonKey(name: 'display_draw_odds')
  int displayDrawOdds;

  @JsonKey(name: 'draw_odds')
  int drawOdds;

  @JsonKey(name: 'is_prize')
  bool isPrize;

  @JsonKey(name: 'is_certificate')
  bool isCertificate;

  @JsonKey(name: 'max_boomcoin_discount_pct')
  double maxBoomcoinDiscountPct;

  @JsonKey(name: 'is_enabled')
  bool isEnabled;

  @JsonKey(name: 'is_virtual')
  bool isVirtual;

  @JsonKey(name: 'certificate_products')
  List<dynamic> certificateProducts;

  @JsonKey(name: 'listings')
  List<int> listings;

  Product(
    this.id,
    this.boomId,
    this.productSku,
    this.name,
    this.nameSelect,
    this.listImage,
    this.description,
    this.qty,
    this.price,
    this.salesPrice,
    this.shipping,
    this.isDrawable,
    this.displayDrawOdds,
    this.drawOdds,
    this.isPrize,
    this.isCertificate,
    this.maxBoomcoinDiscountPct,
    this.isEnabled,
    this.isVirtual,
    this.certificateProducts,
    this.listings,
  );

  factory Product.fromJson(Map<String, dynamic> srcJson) =>
      _$ProductFromJson(srcJson);
}

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'boom_id')
  String boomId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'role')
  String role;

  @JsonKey(name: 'is_boom_vip')
  bool isBoomVip;

  @JsonKey(name: 'level')
  int level;

  @JsonKey(name: 'age')
  int age;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'is_following')
  bool isFollowing;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'signature')
  String signature;

  User(
    this.boomId,
    this.nickname,
    this.role,
    this.isBoomVip,
    this.level,
    this.age,
    this.avatar,
    this.isFollowing,
    this.phone,
    this.signature,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);
}

@JsonSerializable()
class Tags extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name_en')
  String nameEn;

  @JsonKey(name: 'name_zh')
  String nameZh;

  @JsonKey(name: 'sortorder')
  int sortorder;

  @JsonKey(name: 'is_enabled')
  bool isEnabled;

  Tags(
    this.id,
    this.nameEn,
    this.nameZh,
    this.sortorder,
    this.isEnabled,
  );

  factory Tags.fromJson(Map<String, dynamic> srcJson) =>
      _$TagsFromJson(srcJson);
}

@JsonSerializable()
class Meta extends Object {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> srcJson) =>
      _$MetaFromJson(srcJson);
}
