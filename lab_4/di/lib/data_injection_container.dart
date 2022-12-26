import 'package:data/datasources/json/news_json_data_source.dart';
import 'package:data/repositories/news_repository_impl.dart';
import 'package:domain/repositories/news_repository.dart';
import 'package:get_it/get_it.dart';

Future initData() async {
  var getIt = GetIt.instance;
  //DataSources
  getIt.registerLazySingleton<NewsJsonDataSource>(() => NewsJsonDataSourceImpl());
  //Repositorii
  getIt.registerLazySingleton<NewsRepository>(() => NewsRepositoryImpl(getIt.get<NewsJsonDataSource>()));
}