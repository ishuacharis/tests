part of 'people_bloc.dart';

abstract class PeopleState extends Equatable {

  const PeopleState();
  
  @override
  List<Object> get props => [];
}

class PeopleInitial extends PeopleState {
  PeopleInitial() : super();
}

class PeopleLoading extends PeopleState {
  PeopleLoading() : super();
}

class PeopleLoaded extends PeopleState {
  final People people;
  PeopleLoaded({ required this.people }) : super();

  @override
  List<Object> get props => [people];
}

class PeopleError extends PeopleState {
  final String message;

  PeopleError({required this.message});

  @override
  List<Object> get props => [message];
}