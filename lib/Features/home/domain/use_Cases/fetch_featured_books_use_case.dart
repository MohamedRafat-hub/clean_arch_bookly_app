import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/use_cases/no_param_use_case.dart';



class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>> {
  HomeRepo _homeRepo;

  FetchFeaturedBooksUseCase(this._homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call() {
    return _homeRepo.fetchFeaturedBooks();
  }
}




