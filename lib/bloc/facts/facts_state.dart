
import 'package:cat_trivia/model/cat_facts.dart';
import 'package:equatable/equatable.dart';

abstract class FactsState extends Equatable {
  @override
  List<Object> get props => [];
}

class FactsInitial extends FactsState {}

class FactsLoading extends FactsState {}

class FactsLoaded extends FactsState {
  final List<Cat> facts;

  FactsLoaded(this.facts);

  @override
  List<Object> get props => [facts];
}

class FactsError extends FactsState {
  final String message;

  FactsError(this.message);

  @override
  List<Object> get props => [message];
}