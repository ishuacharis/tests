import 'package:tests/features/auth/domain/entities/UserEntity.dart';

class UserModel  extends UserEntity {
  final String? username;
  final String? password;
  final String? email;
  final String? phoneNo;

  UserModel({
    required this.email, required this.phoneNo, required this.username , this.password
  } ) : super(email: email,username: username, password: password, phoneNo: phoneNo) ;

  factory UserModel.fromJson(dynamic json) {
    return UserModel(email: json["email"], phoneNo: json["phoneNo"], username: json["username"],
        password: json["password"]);
  }

  Map<String, dynamic> toJson() {
    var map =  Map<String, dynamic>();
    map["email"] = email;
    map["username"] = username;
    map["password"] = password;
    map["phone"] = phoneNo;

    return map;
  }
  UserModel copyWith({
    String? username,
      String? password,
      String? email,
      String? phoneNo
  }) {
    return UserModel(email: email?? this.email,
        phoneNo: phoneNo?? this.phoneNo, username: username?? this.username,
        password: password?? this.password);
  }
  @override
  List<Object?> get props => [ ];
}