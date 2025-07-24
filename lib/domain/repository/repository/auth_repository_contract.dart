


import 'package:dartz/dartz.dart';
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';
import 'package:e_comerce/domain/entieties/fauilers.dart';

abstract class AuthRepositoryContract{
 Future<Either<Failures,AuthResultEntity>> register(
     String name,String password,
     String email,String phone,
     String rePassword);

 Future<Either<Failures,AuthResultEntity>> login(
     String password,
     String email
     );
}
