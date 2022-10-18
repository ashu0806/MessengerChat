// ignore_for_file: public_member_api_docs, sort_constructors_first

class ChatContactModel {
  final String name;
  final String profilePic;
  final String contactId;
  final DateTime sentTime;
  final String lastMessage;

  ChatContactModel({
    required this.name,
    required this.profilePic,
    required this.contactId,
    required this.sentTime,
    required this.lastMessage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'profilePic': profilePic,
      'contactId': contactId,
      'sentTime': sentTime.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
    };
  }

  factory ChatContactModel.fromMap(Map<String, dynamic> map) {
    return ChatContactModel(
      name: map['name'] as String,
      profilePic: map['profilePic'] as String,
      contactId: map['contactId'] as String,
      sentTime: DateTime.fromMillisecondsSinceEpoch(map['sentTime'] as int),
      lastMessage: map['lastMessage'] as String,
    );
  }
}
