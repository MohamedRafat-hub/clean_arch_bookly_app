import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource
{
  List<BookEntity>fetchFeaturedBookds();
  List<BookEntity>fetchNewestBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource
{
  @override
  List<BookEntity> fetchFeaturedBookds() {
    // TODO: implement fetchFeaturedBookds
    throw UnimplementedError();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }
}