import 'package:equatable/equatable.dart';

class HomeEvent extends Equatable {
  @override
  List<Object> get props => null;
}

class FetchHomeEvent extends HomeEvent {}

class GetDetailHomeEvent extends HomeEvent {

  final int id;

  GetDetailHomeEvent({
    this.id
  });
}

class PostHomeEvent extends HomeEvent {
  final String name;

  PostHomeEvent({
    this.name
  });
}

class PutHomeEvent extends HomeEvent {
  final String id;
  final String name;

  PutHomeEvent({
    this.id,
    this.name
  });
}

class DeleteHomeEvent extends HomeEvent {
  final String id;

  DeleteHomeEvent({
    this.id
  });
}