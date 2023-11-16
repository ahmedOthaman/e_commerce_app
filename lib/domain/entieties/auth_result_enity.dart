import 'package:e_comerce/domain/entieties/UserEntety.dart';

class AuthResultEntity{
  UserEntity? userEntity;
  String? token;
  AuthResultEntity({required this.userEntity,required this.token});

}

