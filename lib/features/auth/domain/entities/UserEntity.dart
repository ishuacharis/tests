
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? username;
  final String? password;
  final String? email;
  final String? phoneNo;
  UserEntity( {
    required this.email, required this.phoneNo, required this.username , this.password
} );

  factory UserEntity.fromJson(dynamic json) {
    return UserEntity(email: json["email"], phoneNo: json["phoneNo"], username: json["username"],
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
  UserEntity copyWith({
    String? username,
    String? password,
    String? email,
    String? phoneNo
  }) {
    return UserEntity(email: email?? this.email,
        phoneNo: phoneNo?? this.phoneNo, username: username?? this.username,
        password: password?? this.password);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [ username, email, phoneNo, email ];
}