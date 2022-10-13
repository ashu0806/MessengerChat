// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String name;
  final String uId;
  final String profilePic;
  final bool isOnline;
  final String phoneNumber;
  // final List<String> groupIds;

  UserModel({
    required this.name,
    required this.uId,
    required this.profilePic,
    required this.isOnline,
    required this.phoneNumber,
    // required this.groupIds,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uId': uId,
      'profilePic': profilePic,
      'isOnline': isOnline,
      'phoneNumber': phoneNumber,
      // 'groupIds': groupIds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      uId: map['uId'] as String,
      profilePic: map['profilePic'] as String,
      isOnline: map['isOnline'] as bool,
      phoneNumber: map['phoneNumber'] as String,
      // groupIds: List<String>.from(
      //   (map['groupIds'] as List<String>),
      // ),
    );
  }
}
