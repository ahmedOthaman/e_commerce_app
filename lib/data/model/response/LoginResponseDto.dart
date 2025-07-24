import 'package:e_comerce/data/model/response/UserDto.dart';

import '../../../domain/entieties/auth_result_enity.dart';

class LoginResponseDto {
  LoginResponseDto({
    this.message,
    this.user,
    this.statusMsg,
    this.token,});

  LoginResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }

    map['token'] = token;
    return map;
  }
  AuthResultEntity tOAuthResultEntity(){
    return AuthResultEntity(
        userEntity:user?.toUserEntity(),
        token: token);
  }


}