part of 'people_bloc.dart';

abstract class PeopleState extends Equatable {
  final People? people;
  const PeopleState({this.people});
  
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
  PeopleLoaded({ required this.people }) : super(people: people);
}

class PeopleError extends PeopleState {}