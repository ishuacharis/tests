import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tests/core/constants/enums/internet_status.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/core/shared/internet/bloc/connection/connection_bloc.dart';
import 'package:tests/features/tmdb/data/model/person_model.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import 'package:tests/features/tmdb/domain/usecase/get_single_person_usecase.dart';
import '../../data/model/people.dart';
import 'package:tests/features/tmdb/domain/usecase/get_people_usecase.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {

  final GetAllPeopleUseCase getAllPeopleUseCase;
  final GetPersonUseCase getPersonUseCase;
  final ConnectionBloc internetBloc;
  late StreamSubscription streamSubscription;

  PeopleBloc({
    required GetAllPeopleUseCase peopleUseCase,
    required GetPersonUseCase personUseCase,
    required this.internetBloc })
      :
        getAllPeopleUseCase = peopleUseCase,
        getPersonUseCase = personUseCase,
        super(PeopleInitial()){
    streamSubscription =  internetBloc.stream.listen(( ConnectionState internetState) {
      monitorInternetConnection(internetState);
    });
  }

  void monitorInternetConnection(ConnectionState internetState) {
    if(internetState is InternetConnectedState &&
        internetState.internetStatus == InternetStatus.Connected ){
      add(GetAllPeopleEvent(isConnected: true));
    } else if(internetState is InternetDisconnectedState &&
        internetState.internetStatus == InternetStatus.Disconnected){
      add(GetAllPeopleEvent(isConnected: false));
    }
  }


  @override
  Stream<PeopleState> mapEventToState(PeopleEvent event,) async* {
    if (event is GetAllPeopleEvent) {
      yield PeopleLoading();
      final failureOrPeople = await getAllPeopleUseCase(NoParams());
      yield* _eitherLoadedOrError(failureOrPeople,event.isConnected);

    } else if(event is GetNoNetWorkPeopleEvent) {
      yield PeopleLoading();
      final failureOrPeople = await getAllPeopleUseCase(NoParams());
      yield* _eitherLoadedOrError(failureOrPeople,false);
    } else if(event is GetSinglePersonEvent) {
      yield PeopleLoading();
      final failureOrPerson = await getPersonUseCase(PersonParams(personId: event.id));
      yield* _eitherPersonLoadedOrError(failureOrPerson,false);
    }
  }

  Stream<PeopleState> _eitherLoadedOrError(Either<Failure, Artist> failureOrPeople , bool dataStatus) async* {
    yield failureOrPeople.fold(
            (error) => PeopleError(message: _buildError(error)),
            (people) => PeopleLoaded(people: _buildPeople(people),isConnected: dataStatus)
    );
  }
  Artist _buildPeople(Artist peopleState) {
    return peopleState;
  }

  Stream<PeopleState> _eitherPersonLoadedOrError(Either<Failure, PersonModel> failureOrPerson , bool dataStatus) async* {
    yield failureOrPerson.fold(
            (error) => PeopleError(message: _buildError(error)),
            (people) => PersonLoaded(personModel: _buildPerson(people),isConnected: dataStatus)
    );
  }
  PersonModel _buildPerson(PersonModel peopleState) {
    return peopleState;
  }
  String _buildError(Failure failure) {
    if (failure is NetWorkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    if (failure is InvalidFormatFailure) return 'Check your data';
    return 'Uncaught error';
  }

  @override
  Future<void> dispose() async {
    streamSubscription.cancel();
    super.close();
  }
}
