import 'package:dartz/dartz.dart';

import 'failure.dart';

typedef Result<T> = Either<Failure, T>;

// TODO zuviel?
typedef FutureResult<T> = Future<Result<T>>;
