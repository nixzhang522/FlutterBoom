// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['boom_id'] as String,
      json['nickname'] as String,
      json['phone'] as String,
      json['username'] as String,
      json['gender'] as String,
      json['birthday'] as String,
      json['signature'] as String,
      (json['tags'] as List)?.map((e) => e as String)?.toList(),
      json['current_deck_id'] as String,
      json['study_plans'] == null
          ? null
          : StudyPlans.fromJson(json['study_plans'] as Map<String, dynamic>),
      json['study_prefs'] == null
          ? null
          : StudyPrefs.fromJson(json['study_prefs'] as Map<String, dynamic>),
      json['study_reasons'] == null
          ? null
          : StudyReasons.fromJson(
              json['study_reasons'] as Map<String, dynamic>),
      json['study_interests'] == null
          ? null
          : StudyInterests.fromJson(
              json['study_interests'] as Map<String, dynamic>),
      json['shipping_addresses'] as List,
      json['timezone'] as String,
      json['setting_system_notification'] as bool,
      json['setting_nondirect_reply_notification'] as bool,
      json['work'] as String,
      json['work_role'] as String,
      json['is_push_course_update'] as bool,
      json['is_push_teacher_new_course'] as bool,
      json['is_push_user_followed'] as bool,
      json['work_place'] as String,
      json['work_place_id'] as String,
      json['boom_vip_expiration'] as String,
      json['role'] as String,
      json['is_boom_vip'] as bool,
      json['level'] as int,
      json['age'] as int,
      json['avatar'] as String,
      json['is_content_dev'] as bool,
      json['created_datetime_ts'] as int);
}

// Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
//       'boom_id': instance.boomId,
//       'nickname': instance.nickname,
//       'phone': instance.phone,
//       'username': instance.username,
//       'gender': instance.gender,
//       'birthday': instance.birthday,
//       'signature': instance.signature,
//       'tags': instance.tags,
//       'current_deck_id': instance.currentDeckId,
//       'study_plans': instance.studyPlans,
//       'study_prefs': instance.studyPrefs,
//       'study_reasons': instance.studyReasons,
//       'study_interests': instance.studyInterests,
//       'shipping_addresses': instance.shippingAddresses,
//       'timezone': instance.timezone,
//       'setting_system_notification': instance.settingSystemNotification,
//       'setting_nondirect_reply_notification':
//           instance.settingNondirectReplyNotification,
//       'work': instance.work,
//       'work_role': instance.workRole,
//       'is_push_course_update': instance.isPushCourseUpdate,
//       'is_push_teacher_new_course': instance.isPushTeacherNewCourse,
//       'is_push_user_followed': instance.isPushUserFollowed,
//       'work_place': instance.workPlace,
//       'work_place_id': instance.workPlaceId,
//       'boom_vip_expiration': instance.boomVipExpiration,
//       'role': instance.role,
//       'is_boom_vip': instance.isBoomVip,
//       'level': instance.level,
//       'age': instance.age,
//       'avatar': instance.avatar,
//       'is_content_dev': instance.isContentDev,
//       'created_datetime_ts': instance.createdDatetimeTs
//     };

StudyPlans _$StudyPlansFromJson(Map<String, dynamic> json) {
  return StudyPlans(
      json['mission_challenged'] as int,
      json['study_min'] as int,
      json['vocab_add'] as int,
      json['vocab_new'] as int,
      json['vocab_review'] as int);
}

// Map<String, dynamic> _$Study_plansToJson(StudyPlans instance) =>
//     <String, dynamic>{
//       'mission_challenged': instance.missionChallenged,
//       'study_min': instance.studyMin,
//       'vocab_add': instance.vocabAdd,
//       'vocab_new': instance.vocabNew,
//       'vocab_review': instance.vocabReview
//     };

StudyPrefs _$StudyPrefsFromJson(Map<String, dynamic> json) {
  return StudyPrefs(json['listen'] as bool, json['read'] as bool,
      json['speak'] as bool, json['write'] as bool);
}

// Map<String, dynamic> _$StudyPrefsToJson(StudyPrefs instance) =>
//     <String, dynamic>{
//       'listen': instance.listen,
//       'read': instance.read,
//       'speak': instance.speak,
//       'write': instance.write
//     };

StudyReasons _$StudyReasonsFromJson(Map<String, dynamic> json) {
  return StudyReasons(json['abroad'] as bool, json['exam'] as bool,
      json['fun'] as bool, json['work'] as bool);
}

// Map<String, dynamic> _$StudyReasonsToJson(StudyReasons instance) =>
//     <String, dynamic>{
//       'abroad': instance.abroad,
//       'exam': instance.exam,
//       'fun': instance.fun,
//       'work': instance.work
//     };

StudyInterests _$StudyInterestsFromJson(Map<String, dynamic> json) {
  return StudyInterests(
      json['business'] as bool,
      json['design'] as bool,
      json['entertainment'] as bool,
      json['fashion'] as bool,
      json['food'] as bool,
      json['funny'] as bool,
      json['game'] as bool,
      json['learn'] as bool,
      json['news'] as bool,
      json['shopping'] as bool,
      json['sports'] as bool,
      json['story'] as bool,
      json['technology'] as bool,
      json['travel'] as bool);
}

// Map<String, dynamic> _$Study_interestsToJson(StudyInterests instance) =>
//     <String, dynamic>{
//       'business': instance.business,
//       'design': instance.design,
//       'entertainment': instance.entertainment,
//       'fashion': instance.fashion,
//       'food': instance.food,
//       'funny': instance.funny,
//       'game': instance.game,
//       'learn': instance.learn,
//       'news': instance.news,
//       'shopping': instance.shopping,
//       'sports': instance.sports,
//       'story': instance.story,
//       'technology': instance.technology,
//       'travel': instance.travel
//     };
