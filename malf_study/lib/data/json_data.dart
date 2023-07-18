import 'dart:convert';

JsonData jsonDataFromJson(String str) => JsonData.fromJson(json.decode(str));

String jsonDataToJson(JsonData data) => json.encode(data.toJson());
String meetingDataToJson(MeetingData data) => json.encode(data.toJson());

class JsonData {
  String status;
  List<MeetingData> data;

  JsonData({
    required this.status,
    required this.data,
  });

  factory JsonData.fromJson(Map<String, dynamic> json) => JsonData(
        status: json["status"],
        data: List<MeetingData>.from(
            json["data"].map((x) => MeetingData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class MeetingData {
  int postId;
  String title;
  String content;
  String authorNickname;
  int authorNation;
  String authorPicture;
  int userType;
  int meetingCapacity;
  String meetingPic;
  String meetingLocation;
  DateTime meetingStartTime;
  int likeCount;
  int likeCheck;
  int participantionStatus;

  MeetingData({
    required this.postId,
    required this.title,
    required this.content,
    required this.authorNickname,
    required this.authorNation,
    required this.authorPicture,
    required this.userType,
    required this.meetingCapacity,
    required this.meetingPic,
    required this.meetingLocation,
    required this.meetingStartTime,
    required this.likeCount,
    required this.likeCheck,
    required this.participantionStatus,
  });

  factory MeetingData.fromJson(Map<String, dynamic> json) => MeetingData(
        postId: json["post_id"],
        title: json["title"],
        content: json["content"],
        authorNickname: json["author_nickname"],
        authorNation: json["author_nation"],
        authorPicture: json["author_picture"],
        userType: json["user_type"],
        meetingCapacity: json["meeting_capacity"],
        meetingPic: json["meeting_pic"],
        meetingLocation: json["meeting_location"],
        meetingStartTime: DateTime.parse(json["meeting_start_time"]),
        likeCount: json["like_count"],
        likeCheck: json["like_check"],
        participantionStatus: json["participantion_status"],
      );

  Map<String, dynamic> toJson() => {
        "like_check": likeCheck,
        "participantion_status": participantionStatus,
      };
}
