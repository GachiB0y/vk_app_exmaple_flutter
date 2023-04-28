// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_wall.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWall _$UserWallFromJson(Map<String, dynamic> json) => UserWall(
      response: json['response'] == null
          ? null
          : Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserWallToJson(UserWall instance) => <String, dynamic>{
      'response': instance.response?.toJson(),
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      count: json['count'] as int?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextFrom: json['next_from'] as String?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'count': instance.count,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'next_from': instance.nextFrom,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      donut: json['donut'] == null
          ? null
          : Donut.fromJson(json['donut'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : Comments.fromJson(json['comments'] as Map<String, dynamic>),
      shortTextRate: (json['short_text_rate'] as num?)?.toDouble(),
      hash: json['hash'] as String?,
      type: json['type'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as int?,
      fromId: json['from_id'] as int?,
      id: json['id'] as int?,
      isFavorite: json['is_favorite'] as bool?,
      likes: json['likes'] == null
          ? null
          : Likes.fromJson(json['likes'] as Map<String, dynamic>),
      ownerId: json['owner_id'] as int?,
      postSource: json['post_source'] == null
          ? null
          : PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
      postType: json['post_type'] as String?,
      reposts: json['reposts'] == null
          ? null
          : Reposts.fromJson(json['reposts'] as Map<String, dynamic>),
      text: json['text'] as String?,
      views: json['views'] == null
          ? null
          : Views.fromJson(json['views'] as Map<String, dynamic>),
    )..copyHistory = (json['copy_history'] as List<dynamic>?)
        ?.map((e) => CopyHistory.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'donut': instance.donut?.toJson(),
      'comments': instance.comments?.toJson(),
      'short_text_rate': instance.shortTextRate,
      'hash': instance.hash,
      'type': instance.type,
      'copy_history': instance.copyHistory?.map((e) => e.toJson()).toList(),
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'date': instance.date,
      'from_id': instance.fromId,
      'id': instance.id,
      'is_favorite': instance.isFavorite,
      'likes': instance.likes?.toJson(),
      'owner_id': instance.ownerId,
      'post_source': instance.postSource?.toJson(),
      'post_type': instance.postType,
      'reposts': instance.reposts?.toJson(),
      'text': instance.text,
      'views': instance.views?.toJson(),
    };

Views _$ViewsFromJson(Map<String, dynamic> json) => Views(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$ViewsToJson(Views instance) => <String, dynamic>{
      'count': instance.count,
    };

Reposts _$RepostsFromJson(Map<String, dynamic> json) => Reposts(
      count: json['count'] as int?,
      userReposted: json['user_reposted'] as int?,
    );

Map<String, dynamic> _$RepostsToJson(Reposts instance) => <String, dynamic>{
      'count': instance.count,
      'user_reposted': instance.userReposted,
    };

PostSource _$PostSourceFromJson(Map<String, dynamic> json) => PostSource(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$PostSourceToJson(PostSource instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

Likes _$LikesFromJson(Map<String, dynamic> json) => Likes(
      canLike: json['can_like'] as int?,
      count: json['count'] as int?,
      userLikes: json['user_likes'] as int?,
      canPublish: json['can_publish'] as int?,
      repostDisabled: json['repost_disabled'] as bool?,
    );

Map<String, dynamic> _$LikesToJson(Likes instance) => <String, dynamic>{
      'can_like': instance.canLike,
      'count': instance.count,
      'user_likes': instance.userLikes,
      'can_publish': instance.canPublish,
      'repost_disabled': instance.repostDisabled,
    };

Attachments _$AttachmentsFromJson(Map<String, dynamic> json) => Attachments(
      type: json['type'] as String?,
      video: json['video'] == null
          ? null
          : Video.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttachmentsToJson(Attachments instance) =>
    <String, dynamic>{
      'type': instance.type,
      'video': instance.video?.toJson(),
    };

CopyHistory _$CopyHistoryFromJson(Map<String, dynamic> json) => CopyHistory(
      type: json['type'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => Attachments.fromJson(e as Map<String, dynamic>))
          .toList(),
      date: json['date'] as int?,
      fromId: json['from_id'] as int?,
      id: json['id'] as int?,
      ownerId: json['owner_id'] as int?,
      postSource: json['post_source'] == null
          ? null
          : PostSource.fromJson(json['post_source'] as Map<String, dynamic>),
      postType: json['post_type'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$CopyHistoryToJson(CopyHistory instance) =>
    <String, dynamic>{
      'type': instance.type,
      'attachments': instance.attachments?.map((e) => e.toJson()).toList(),
      'date': instance.date,
      'from_id': instance.fromId,
      'id': instance.id,
      'owner_id': instance.ownerId,
      'post_source': instance.postSource?.toJson(),
      'post_type': instance.postType,
      'text': instance.text,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      accessKey: json['access_key'] as String?,
      canComment: json['can_comment'] as int?,
      canLike: json['can_like'] as int?,
      canRepost: json['can_repost'] as int?,
      canSubscribe: json['can_subscribe'] as int?,
      canAddToFaves: json['can_add_to_faves'] as int?,
      canAdd: json['can_add'] as int?,
      comments: json['comments'] as int?,
      date: json['date'] as int?,
      description: json['description'] as String?,
      duration: json['duration'] as int?,
      image: (json['image'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int?,
      ownerId: json['owner_id'] as int?,
      title: json['title'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      trackCode: json['track_code'] as String?,
      type: json['type'] as String?,
      views: json['views'] as int?,
      localViews: json['local_views'] as int?,
      platform: json['platform'] as String?,
      canDislike: json['can_dislike'] as int?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'access_key': instance.accessKey,
      'can_comment': instance.canComment,
      'can_like': instance.canLike,
      'can_repost': instance.canRepost,
      'can_subscribe': instance.canSubscribe,
      'can_add_to_faves': instance.canAddToFaves,
      'can_add': instance.canAdd,
      'comments': instance.comments,
      'date': instance.date,
      'description': instance.description,
      'duration': instance.duration,
      'image': instance.image?.map((e) => e.toJson()).toList(),
      'id': instance.id,
      'owner_id': instance.ownerId,
      'title': instance.title,
      'is_favorite': instance.isFavorite,
      'track_code': instance.trackCode,
      'type': instance.type,
      'views': instance.views,
      'local_views': instance.localViews,
      'platform': instance.platform,
      'can_dislike': instance.canDislike,
    };

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      url: json['url'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      withPadding: json['with_padding'] as int?,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'with_padding': instance.withPadding,
    };

Comments _$CommentsFromJson(Map<String, dynamic> json) => Comments(
      canPost: json['can_post'] as int?,
      count: json['count'] as int?,
      groupsCanPost: json['groups_can_post'] as bool?,
    );

Map<String, dynamic> _$CommentsToJson(Comments instance) => <String, dynamic>{
      'can_post': instance.canPost,
      'count': instance.count,
      'groups_can_post': instance.groupsCanPost,
    };

Donut _$DonutFromJson(Map<String, dynamic> json) => Donut(
      isDonut: json['is_donut'] as bool?,
    );

Map<String, dynamic> _$DonutToJson(Donut instance) => <String, dynamic>{
      'is_donut': instance.isDonut,
    };
