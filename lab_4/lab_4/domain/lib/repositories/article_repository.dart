import 'package:domain/models/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> getArticlesApi(int page, int per_page);
}
