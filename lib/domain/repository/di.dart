import 'package:e_comerce/domain/repository/repository/auth_repository_contract.dart';

import '../../data/api/api_manager.dart';
import '../../data/repository/ahuth_repository/data_source/auth_remote_data_source_impl.dart';
import '../../data/repository/ahuth_repository/repository/au_repo_impl.dart';
import '../use_case/login_use_case.dart';
import '../use_case/register_use_case.dart';
import 'data_source/auth_remote_data_source.dart';

LoginUseCase  injectLoginUseCase(){
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());

}
RegisterUseCase  injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());

}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstanse());
}
AuthRepositoryContract injectAuthRepositoryContract(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}