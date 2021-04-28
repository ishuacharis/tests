import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/core/exceptions/failure.dart';
import 'package:tests/features/tmdb/domain/entity/artist_entity.dart';
import '../../data/model/people.dart';
import 'package:tests/features/tmdb/domain/usecase/get_people_usecase.dart';

part 'people_event.dart';
part 'people_state.dart';

class PeopleBloc extends Bloc<PeopleEvent, PeopleState> {

  final GetAllPeopleUseCase getAllPeopleUseCase;

  PeopleBloc({required GetAllPeopleUseCase peopleUseCase })
      :
        getAllPeopleUseCase = peopleUseCase,
        super(PeopleInitial());

  @override
  Stream<PeopleState> mapEventToState(PeopleEvent event,) async* {
    if (event is GetAllPeopleEvent) {
      final failureOrPeople = await getAllPeopleUseCase(NoParams());

      yield PeopleLoading();
      yield failureOrPeople.fold(
              (error) => PeopleError(message: _buildError(error)),
              (people) => PeopleLoaded(people: people)
      );
    }
  }

  String _buildError(Failure failure) {
    if (failure is NetWorkFailure) return 'Check your internet settings';
    if (failure is ServerFailure) return 'Unable to connect server';
    if (failure is InvalidFormatFailure) return 'Check your data';
    return 'Uncaught error';
  }
}
