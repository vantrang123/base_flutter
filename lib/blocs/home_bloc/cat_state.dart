import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/cat.dart';

abstract class CatState extends Equatable {
  const CatState();

  @override
  List<Object> get props => [];
}

class CatEmpty extends CatState {}

class CatLoading extends CatState {}

class CatError extends CatState {}

class CatLoaded extends CatState {
  final List<CatPhoto> books;

  const CatLoaded({this.books});

  CatLoaded copyWith({List<CatPhoto> posts}) {
    return CatLoaded(books: posts ?? this.books);
  }

  @override
  List<Object> get props => [books];

  @override
  String toString() => 'PostLoaded { posts: ${books.length} }';
}