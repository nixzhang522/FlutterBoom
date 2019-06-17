import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  @JsonKey(name: 'boom_id')
  String boomId;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'birthday')
  String birthday;

  @JsonKey(name: 'signature')
  String signature;

  @JsonKey(name: 'tags')
  List<String> tags;

  @JsonKey(name: 'current_deck_id')
  String currentDeckId;

  @JsonKey(name: 'StudyPlans')
  StudyPlans studyPlans;

  @JsonKey(name: 'study_prefs')
  StudyPrefs studyPrefs;

  @JsonKey(name: 'study_reasons')
  StudyReasons studyReasons;

  @JsonKey(name: 'study_interests')
  StudyInterests studyInterests;

  @JsonKey(name: 'shipping_addresses')
  List<dynamic> shippingAddresses;

  @JsonKey(name: 'timezone')
  String timezone;

  @JsonKey(name: 'setting_system_notification')
  bool settingSystemNotification;

  @JsonKey(name: 'setting_nondirect_reply_notification')
  bool settingNondirectReplyNotification;

  @JsonKey(name: 'work')
  String work;

  @JsonKey(name: 'work_role')
  String workRole;

  @JsonKey(name: 'is_push_course_update')
  bool isPushCourseUpdate;

  @JsonKey(name: 'is_push_teacher_new_course')
  bool isPushTeacherNewCourse;

  @JsonKey(name: 'is_push_user_followed')
  bool isPushUserFollowed;

  @JsonKey(name: 'work_place')
  String workPlace;

  @JsonKey(name: 'work_place_id')
  String workPlaceId;

  @JsonKey(name: 'boom_vip_expiration')
  String boomVipExpiration;

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

  @JsonKey(name: 'is_content_dev')
  bool isContentDev;

  @JsonKey(name: 'created_datetime_ts')
  int createdDatetimeTs;

  User(
    this.boomId,
    this.nickname,
    this.phone,
    this.username,
    this.gender,
    this.birthday,
    this.signature,
    this.tags,
    this.currentDeckId,
    this.studyPlans,
    this.studyPrefs,
    this.studyReasons,
    this.studyInterests,
    this.shippingAddresses,
    this.timezone,
    this.settingSystemNotification,
    this.settingNondirectReplyNotification,
    this.work,
    this.workRole,
    this.isPushCourseUpdate,
    this.isPushTeacherNewCourse,
    this.isPushUserFollowed,
    this.workPlace,
    this.workPlaceId,
    this.boomVipExpiration,
    this.role,
    this.isBoomVip,
    this.level,
    this.age,
    this.avatar,
    this.isContentDev,
    this.createdDatetimeTs,
  );

  factory User.fromJson(Map<String, dynamic> srcJson) =>
      _$UserFromJson(srcJson);
}

@JsonSerializable()
class StudyPlans extends Object {
  @JsonKey(name: 'mission_challenged')
  int missionChallenged;

  @JsonKey(name: 'study_min')
  int studyMin;

  @JsonKey(name: 'vocab_add')
  int vocabAdd;

  @JsonKey(name: 'vocab_new')
  int vocabNew;

  @JsonKey(name: 'vocab_review')
  int vocabReview;

  StudyPlans(
    this.missionChallenged,
    this.studyMin,
    this.vocabAdd,
    this.vocabNew,
    this.vocabReview,
  );

  factory StudyPlans.fromJson(Map<String, dynamic> srcJson) =>
      _$StudyPlansFromJson(srcJson);
}

@JsonSerializable()
class StudyPrefs extends Object {
  @JsonKey(name: 'listen')
  bool listen;

  @JsonKey(name: 'read')
  bool read;

  @JsonKey(name: 'speak')
  bool speak;

  @JsonKey(name: 'write')
  bool write;

  StudyPrefs(
    this.listen,
    this.read,
    this.speak,
    this.write,
  );

  factory StudyPrefs.fromJson(Map<String, dynamic> srcJson) =>
      _$StudyPrefsFromJson(srcJson);
}

@JsonSerializable()
class StudyReasons extends Object {
  @JsonKey(name: 'abroad')
  bool abroad;

  @JsonKey(name: 'exam')
  bool exam;

  @JsonKey(name: 'fun')
  bool fun;

  @JsonKey(name: 'work')
  bool work;

  StudyReasons(
    this.abroad,
    this.exam,
    this.fun,
    this.work,
  );

  factory StudyReasons.fromJson(Map<String, dynamic> srcJson) =>
      _$StudyReasonsFromJson(srcJson);
}

@JsonSerializable()
class StudyInterests extends Object {
  @JsonKey(name: 'business')
  bool business;

  @JsonKey(name: 'design')
  bool design;

  @JsonKey(name: 'entertainment')
  bool entertainment;

  @JsonKey(name: 'fashion')
  bool fashion;

  @JsonKey(name: 'food')
  bool food;

  @JsonKey(name: 'funny')
  bool funny;

  @JsonKey(name: 'game')
  bool game;

  @JsonKey(name: 'learn')
  bool learn;

  @JsonKey(name: 'news')
  bool news;

  @JsonKey(name: 'shopping')
  bool shopping;

  @JsonKey(name: 'sports')
  bool sports;

  @JsonKey(name: 'story')
  bool story;

  @JsonKey(name: 'technology')
  bool technology;

  @JsonKey(name: 'travel')
  bool travel;

  StudyInterests(
    this.business,
    this.design,
    this.entertainment,
    this.fashion,
    this.food,
    this.funny,
    this.game,
    this.learn,
    this.news,
    this.shopping,
    this.sports,
    this.story,
    this.technology,
    this.travel,
  );

  factory StudyInterests.fromJson(Map<String, dynamic> srcJson) =>
      _$StudyInterestsFromJson(srcJson);
}
