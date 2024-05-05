part of 'stream_bloc.dart';

sealed class StreamState extends Equatable {
  const StreamState();
  
  @override
  List<Object> get props => [];
}

final class StreamInitial extends StreamState {}
