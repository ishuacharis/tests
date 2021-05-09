import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import '../../data/model/people.dart';
import 'package:tests/features/tmdb/domain/usecase/get_people_usecase.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {

  final GetAllPeopleUseCase getAllPeopleUseCase;
  InternetConnectionChecker internetConnectionChecker = InternetConnectionChecker();

  PeopleBloc({required GetAllPeopleUseCase peopleUseCase })
      :
        getAllPeopleUseCase = peopleUseCase,
        super(PeopleInitial());


  @override
  Stream<PeopleState> mapEventToState(PeopleEvent event,) async* {
    if (event is GetAllPeopleEvent) {
      final failureOrPeople = await getAllPeopleUseCase(NoParams());

      yield PeopleLoading();
      yield* _eitherLoadedOrError(failureOrPeople);
    }
  }

  Stream<PeopleState> _eitherLoadedOrError(Either<Failure, Artist> failureOrPeople) async* {
    yield failureOrPeople.fold(
            (error) => PeopleError(message: _buildError(error)),
            (people) => PeopleLoaded(people: _buildPeople(people))
    );
  }
  Artist _buildPeople(Artist peopleState) {
    return peopleState;
  }
  String _buildError(Failure failure) {
    if (failure is NetWorkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    if (failure is InvalidFormatFailure) return 'Check your data';
    return 'Uncaught error';
  }
}
