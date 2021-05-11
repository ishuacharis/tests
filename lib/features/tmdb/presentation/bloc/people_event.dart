part of 'people_bloc.dart';

abstract class PeopleEvent extends Equatable {
  PeopleEvent();

  @override
  List<Object> get props => [];
}

class GetAllPeopleEvent extends PeopleEvent {}

class GetNoNetWorkPeopleEvent extends PeopleEvent{}
