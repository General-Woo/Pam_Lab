import 'package:domain/models/featured.dart';
import 'package:domain/models/news.dart';
import 'package:domain/use_cases/get_featured_from_json_use_case.dart';
import 'package:domain/use_cases/get_news_from_json_use_case.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:lab_4/resources/files.dart';

class HomeController extends GetxController{

  RxList<News> news = RxList();
  RxList<Featured> featured = RxList();

  var getFeatured = GetIt.instance.get<GetFeaturedFromJsonUseCase>();
  var getNews = GetIt.instance.get<GetNewsFromJsonUseCase>();


  void readJsonFile() async {
    news.value = await getNews(Files.news);
    featured.value = await getFeatured(Files.news);
  }

  String numberFormat(int number) {
    if(number>1000000){
      return "${(number/1000000.0).toStringAsFixed(1)}M";
    }
    else if(number>1000){
      return "${(number/1000.0).toStringAsFixed(1)}K";
    }
    return "${number}";
  }

}