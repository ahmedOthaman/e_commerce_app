import 'package:dartz/dartz.dart';
import 'package:e_comerce/data/repository/ahuth_repository/repository/au_repo_impl.dart';
import 'package:e_comerce/domain/entieties/auth_result_enity.dart';
import 'package:e_comerce/domain/entieties/fauilers.dart';
import 'package:e_comerce/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;

  RegisterUseCase({required this.repositoryContract});

  Future<Either<Failures,AuthResultEntity>> invoke(String name, String password, String email,
      String phone, String rePassword) {
    return repositoryContract.register(
        name, password, email, phone, rePassword);
  }
}

