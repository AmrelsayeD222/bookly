import 'package:bookly/core/network/services/api_service.dart';
import 'package:bookly/core/utils/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: featuredEndPoint);
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookEntity.fromJson(item));
    }
    var box = Hive.box<BookEntity>(featuredBooksBox);
    box.addAll(books);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiService.get(endPoint: newestEndPoint);
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookEntity.fromJson(item));
    }
    var box = Hive.box<BookEntity>(newestBooksBox);
    box.addAll(books);
    return books;
  }
}
