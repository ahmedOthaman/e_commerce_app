import 'package:e_comerce/data/model/response/Error.dart';
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';
import 'UserDto.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmeddmutti4@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1NDU2NTMwNjA0Y2JkZWYzM2M1ZmQ0ZSIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNjk5MDQ2NzA0LCJleHAiOjE3MDY4MjI3MDR9.tiEZpOHvshARHnNrm_5qtr6pm-pGDLfCj-eV0XfyULI"

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user,
    this.statusMsg,
    this.error,
      this.token,});

  RegisterResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Errore.fromJson(json['error']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;
  Errore? error;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (error != null) {
      map['errors'] = error?.toJson();
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