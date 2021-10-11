import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:smocabulary/core/domain/result.dart';

abstract class UseCase<T, P extends Params> {
  @nonVirtual
  Future<Result<T>> call(P params) async {
    // try {
    return await execute(params);
    // } catch (e) {
    //   // log e
    //   print(e);
    //   return Left(UnknownFailure());
    // }
  }

  Future<Result<T>> execute(P params);
}

class NoParams extends Params {
  NoParams() : super();
  @override
  List<Object> get props => [];
}

abstract class Params extends Equatable {}
