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
  final Artist people;
  final bool isConnected;
  PeopleLoaded({ required this.people, this.isConnected = false }) : super();

  @override
  List<Object> get props => [people];
}

class PersonLoaded extends PeopleState {
  final PersonModel personModel;
  final bool isConnected;
  PersonLoaded({ required this.personModel, this.isConnected = false }) : super();

  @override
  List<Object> get props => [personModel];
}

class PeopleError extends PeopleState {
  final String message;

  PeopleError({required this.message});

  @override
  List<Object> get props => [message];
}