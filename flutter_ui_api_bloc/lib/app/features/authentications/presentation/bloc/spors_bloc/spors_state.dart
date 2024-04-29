part of 'spors_bloc.dart';

sealed class SporsState extends Equatable {
  const SporsState();
  
  @override
  List<Object?> get props => [];
}

final class SporsInitial extends SporsState {}

final class SporsLoadingState extends SporsState{}

final class SporsLoadedState extends SporsState{
  final Spors? teams;
  const SporsLoadedState ({this.teams});
}

final class SporsErrorState extends SporsState {}
