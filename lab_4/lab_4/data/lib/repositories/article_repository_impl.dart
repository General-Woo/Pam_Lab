import 'package:data/datasources/api/news_api_data_source.dart';
import 'package:data/mappers/article_mapper.dart';
import 'package:domain/models/article.dart';
import 'package:domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiDataSource newsApiDataSource;

  ArticleRepositoryImpl(this.newsApiDataSource);

  @override
  Future<List<Article>> getArticlesApi(int page, int per_page) async{
    var articles = await newsApiDataSource.getArticles(page, per_page);
    return articles.map((e) => ArticleMapper().mapApiDtoToModel(e)).toList();
  }
}