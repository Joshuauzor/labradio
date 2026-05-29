import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:labradio/core/core.dart';

///[UseCase] is the interface that enforce the usecases structure of the app
// ignore: one_member_abstracts, avoid_types_as_parameter_names
abstract class UseCase<Type, Params> {
  ///[call] is the method that is responsible for executing the usecase
  Future<Either<Failure, Type>> call(Params params);
}

///[NoParams] is the type of the parameter that the usecase doesn't need
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
