part of 'spors_bloc.dart';

sealed class SporsEvent extends Equatable {
  const SporsEvent();

  @override
  List<Object> get props => [];
}

final class FetchSporsEvent extends SporsEvent {

  final String league;

  const FetchSporsEvent({required this.league});

  @override
  List<Object> get props => [league];
}

final class SporsIniEvent extends SporsEvent {

  @override
  List<Object> get props => [];
}



