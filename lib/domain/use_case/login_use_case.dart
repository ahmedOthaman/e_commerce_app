import 'package:dartz/dartz.dart';

import '../../data/repository/ahuth_repository/repository/au_repo_impl.dart';
import '../entieties/auth_result_enity.dart';
import '../entieties/fauilers.dart';
import '../repository/repository/auth_repository_contract.dart';

class LoginUseCase {
  AuthRepositoryContract repositoryContract;

  LoginUseCase({required this.repositoryContract});

  Future<Either<Failures,AuthResultEntity>> invoke(String password, String email)
  {
    return repositoryContract.login(
        password, email);
  }
}
