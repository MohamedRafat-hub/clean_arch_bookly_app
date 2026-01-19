import 'package:bookly/Features/home/data/models/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

import 'package:bookly/core/utils/api_service.dart';
import 'package:hive/hive.dart';

import '../../../../constants.dart';

abstract class HomeRemoteDataSource
{
  Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>>fetchNewestBooks();
}


class HomeRepoDataSourseImpl extends HomeRemoteDataSource
{
  final ApiService apiService;

  HomeRepoDataSourseImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks()async {
    var data =await apiService.get(endPoint: 'volumes?filter=free-ebooks&q=programming');
    List<BookEntity>books = [];

    for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
    saveBoxData(books , KFeaturedBox);
    return books;
  }

  void saveBoxData(List<BookEntity> books , String boxName) {
    var box = Hive.box(KFeaturedBox);
    box.addAll(books);
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks()async {
    Map<String,dynamic> data =await apiService.get(endPoint: 'volumes?filter=free-ebooks&orderBy=Newest&q=programming');
    List<BookEntity>books = [];

    for(var item in data['items'])
      {
        books.add(BookModel.fromJson(item));
      }
    saveBoxData(books , KNewestBox);
    return books;
  }
  
}