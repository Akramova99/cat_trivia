
import 'package:equatable/equatable.dart';

abstract class FactsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchFacts extends FactsEvent {}