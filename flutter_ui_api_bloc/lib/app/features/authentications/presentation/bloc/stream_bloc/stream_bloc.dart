import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../services/firestore.dart';

part 'stream_event.dart';
part 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  final FirestoreService firestoreService = FirestoreService();

  StreamBloc() : super(NoteInitial()) {
    on<LoadNotesEvent>(_onLoadNotesEvent);
    on<AddNotesEvent>(_onAddNotesEvent);
    on<UpdateNotesEvent>(_onUpdateNotesEvent);
    on<DeleteNotesEvent>(_onDeleteNotesEvent);
  }

  Future<void> _onLoadNotesEvent(
      StreamEvent event, Emitter<StreamState> emit) async {
    /* emit(NoteLoading());
    try {
      final stream = firestoreService.getNotesStream();
      await for (final snapshot in stream) {
        emit(NotesLoaded(snapshot.docs));
      }
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    } */
    emit(NoteLoading());
    final stream = firestoreService.getNotesStream();

    emit.onEach<QuerySnapshot>(
      stream,
      onData: (snapshot) {
        emit(NotesLoaded(snapshot.docs));
      },
      onError: (error, stackTrace) {
        emit(const NoteError("Failed to load notes"));
      },
    );
  }

  FutureOr<void> _onAddNotesEvent(
      AddNotesEvent event, Emitter<StreamState> emit) {
    emit(NoteLoading());
    try {
      firestoreService.addNote(event.note!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  FutureOr<void> _onUpdateNotesEvent(
      UpdateNotesEvent event, Emitter<StreamState> emit) {
    emit(NoteLoading());
    try {
      firestoreService.updateNote(event.id!, event.note!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  FutureOr<void> _onDeleteNotesEvent(
      DeleteNotesEvent event, Emitter<StreamState> emit) {
    emit(NoteLoading());
    try {
      firestoreService.deleteNote(event.id!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }
}
