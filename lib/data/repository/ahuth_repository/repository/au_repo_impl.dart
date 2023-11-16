
import 'package:dartz/dartz.dart';
import 'package:e_comerce/data/repository/ahuth_repository/data_source/auth_remote_data_source_impl.dart';
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';
import 'package:e_comerce/domain/entieties/fauilers.dart';

import '../../../../domain/repository/data_source/auth_remote_data_source.dart';
import '../../../../domain/repository/repository/auth_repository_contract.dart';
import '../../../model/response/RegisterResponseDto.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
AuthRemoteDataSource remoteDataSource;
AuthRepositoryImpl({required this.remoteDataSource});
@override
Future<Either<Failures,AuthResultEntity>> register(String name, String password, String email, String phone, String rePassword) {
return remoteDataSource.register(name, password, email, phone, rePassword);
}

  @override
  Future<Either<Failures, AuthResultEntity>> login(String password, String email) {
    return remoteDataSource.login( password, email);

  }

}
