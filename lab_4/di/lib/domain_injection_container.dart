import 'package:domain/repositories/news_repository.dart';
import 'package:domain/use_cases/get_featured_from_json_use_case.dart';
import 'package:domain/use_cases/get_news_from_json_use_case.dart';
import 'package:get_it/get_it.dart';

Future initDomain() async {
  var getIt = GetIt.instance;

  getIt.registerLazySingleton<GetNewsFromJsonUseCase>(() => GetNewsFromJsonUseCase(getIt.get<NewsRepository>()));
  getIt.registerLazySingleton<GetFeaturedFromJsonUseCase>(() =>GetFeaturedFromJsonUseCase(getIt.get<NewsRepository>()));
}