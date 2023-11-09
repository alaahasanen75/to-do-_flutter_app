import 'package:get_it/get_it.dart';

final GetIt getit = GetIt.instance;

class Services {
  void init() {
    // getit.registerLazySingleton(() => LoginUseCase(getit()));
    // getit.registerLazySingleton(() => HomeUseCase(getit()));
    // getit.registerLazySingleton(() => ResetUseCase(getit()));
    // getit.registerLazySingleton(() => AppCubit(getit(), getit(), getit()));
    // getit.registerLazySingleton<BaseRepo>(() => Repo(getit()));
    // getit.registerLazySingleton<BaseRemoteDatasource>(
    //     () => LoginRemoteDatasource());
  }
}
