part of 'stream_bloc.dart';

sealed class StreamEvent extends Equatable {
  const StreamEvent();

  @override
  List<Object?> get props => [];
}

final class LoadNotesEvent extends StreamEvent {}

final class AddNotesEvent extends StreamEvent {
  final String? note;

  const AddNotesEvent({this.note});

  @override
  List<Object?> get props => [note];
}

final class UpdateNotesEvent extends StreamEvent {
  final String? note;
  final String? id;

  const UpdateNotesEvent({this.note, this.id});

  @override
  List<Object?> get props => [note, id];
}

final class DeleteNotesEvent extends StreamEvent {
  final String? id;

  const DeleteNotesEvent({this.id});

  @override
  List<Object?> get props => [id];
}
