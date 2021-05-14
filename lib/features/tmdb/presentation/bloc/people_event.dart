part of 'people_bloc.dart';

abstract class PeopleEvent extends Equatable {
  PeopleEvent();

  @override
  List<Object> get props => [];
}

class GetAllPeopleEvent extends PeopleEvent {
  final bool isConnected;
  GetAllPeopleEvent({this.isConnected = false});
}
class GetSinglePersonEvent extends PeopleEvent {
  final int id;
  GetSinglePersonEvent({ required this.id });
}

class GetNoNetWorkPeopleEvent extends PeopleEvent{}
