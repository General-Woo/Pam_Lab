import 'package:domain/models/portal.dart';

class News {
  final String cover;
  final String title;
  final String category;
  final Portal portal;
  final int likes;
  final int comments;

  News(this.cover, this.title, this.category, this.portal, this.likes, this.comments);
}