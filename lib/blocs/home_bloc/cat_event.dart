import 'package:equatable/equatable.dart';

abstract class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Fetch extends CatEvent {}