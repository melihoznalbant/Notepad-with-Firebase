part of 'stream_bloc.dart';

sealed class StreamState extends Equatable {
  const StreamState();

  @override
  List<Object> get props => [];
}

final class NoteInitial extends StreamState {
  @override
  List<Object> get props => [];
}

final class NoteLoading extends StreamState {
  @override
  List<Object> get props => [];
}

class NotesLoaded extends StreamState {
  final List<NoteModel> notes;

  const NotesLoaded(this.notes);

  @override
  List<Object> get props => [notes];
}

class NoteError extends StreamState {
  final String message;

  const NoteError(this.message);

  @override
  List<Object> get props => [message];
}
