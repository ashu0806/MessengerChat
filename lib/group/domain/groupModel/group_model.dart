// ignore_for_file: public_member_api_docs, sort_constructors_first

class GroupModel {
  final String senderId;
  final String groupName;
  final String groupId;
  final String lastMessage;
  final String groupProfilePic;
  final List<String> membersUid;
  final DateTime sentTime;

  GroupModel(
    this.senderId,
    this.groupName,
    this.groupId,
    this.lastMessage,
    this.groupProfilePic,
    this.membersUid,
    this.sentTime,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'groupName': groupName,
      'groupId': groupId,
      'lastMessage': lastMessage,
      'groupProfilePic': groupProfilePic,
      'membersUid': membersUid,
      'sentTime': sentTime.millisecondsSinceEpoch,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      map['senderId'] ?? '',
      map['groupName'] ?? '',
      map['groupId'] ?? '',
      map['lastMessage'] ?? '',
      map['groupProfilePic'] ?? '',
      List<String>.from(map['membersUid']),
      DateTime.fromMillisecondsSinceEpoch(map['sentTime']),
    );
  }
}
