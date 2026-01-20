part of 'featured_books_cubit.dart';

@immutable
sealed class FeaturedBooksState {}

final class FeaturedBooksInitial extends FeaturedBooksState {}

final class FeaturedBooksSuccess extends FeaturedBooksState {

  final List<BookEntity>books;

  FeaturedBooksSuccess(this.books);
}

final class FeaturedBooksFailure extends FeaturedBooksState {
  FeaturedBooksFailure(this.errorMessage);
  final errorMessage;
}

final class FeaturedBooksLoading extends FeaturedBooksState {}
