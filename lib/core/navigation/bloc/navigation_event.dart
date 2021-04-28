part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent  extends Equatable {

  List<Object?> get props => [];
}


class NavigationPushName extends NavigationEvent {

  final String route;
  final params;

  NavigationPushName({required this.route, required this.params});
}

class NavigationPop extends NavigationEvent {}

