import 'package:flutter_quizz/models/category_list.dart';

List<CategoryList> getCategoryInfo() {
  List<CategoryList> categoryList = new List<CategoryList>();
  return categoryList = [
    CategoryList(
      categoryName: 'General Knowledge',
      imageUrl: 'assets/gk category.jpeg',
    ),
    CategoryList(
      categoryName: 'Entertainment: Film',
      imageUrl: 'assets/Film catgeory.jpg',
    ),
    CategoryList(
      categoryName: 'Entertainment: Music',
      imageUrl: 'assets/music category.jpg',
    ),
    CategoryList(
      categoryName: 'Entertainment: Video Games',
      imageUrl: 'assets/videogames category.jpg',
    ),
    CategoryList(
      categoryName: 'Science: Computers',
      imageUrl: 'assets/computer category.jpeg',
    ),
    CategoryList(
      categoryName: 'Sports',
      imageUrl: 'assets/sports category.jpg',
    ),
    CategoryList(
      categoryName: 'Entertainment: Japanese Anime & Manga',
      imageUrl: 'assets/anime category.jpg',
    ),
    CategoryList(
      categoryName: 'Entertainment: Cartoon & Animations',
      imageUrl: 'assets/cartoon image.jpg',
    ),
  ];
}
