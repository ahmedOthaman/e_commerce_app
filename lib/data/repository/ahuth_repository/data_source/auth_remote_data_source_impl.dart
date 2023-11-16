import 'package:dartz/dartz.dart';
import 'package:e_comerce/data/api/api_manager.dart';
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';
import 'package:e_comerce/domain/entieties/fauilers.dart';

import '../../../../domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager ;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Failures,AuthResultEntity>> register(String name, String password, String email,
      String phone, String rePassword) async {
   var either=await apiManager.register(name, password, email, phone, rePassword);
  return either.fold((l) {
    return Left(Failures(errorMessage:l.errorMessage));
  }
      , (response) {
    return Right (response.tOAuthResultEntity());
      });
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(String password, String email) async{
    var either=await apiManager.login( password, email);
    return either.fold((l){
      return Left(Failures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.tOAuthResultEntity());
    });
  }

}

