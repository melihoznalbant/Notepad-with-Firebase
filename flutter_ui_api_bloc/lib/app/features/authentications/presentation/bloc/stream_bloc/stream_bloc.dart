import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../services/firestore.dart';
part 'stream_event.dart';
part 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  final FirestoreService firestoreService = FirestoreService();

  StreamBloc() : super(NoteInitial()) {
    on<LoadNotesEvent>(_onLoadNotesEvent);
    on<AddNotesEvent>(
      _onAddNotesEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<UpdateNotesEvent>(
      _onUpdateNotesEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
    on<DeleteNotesEvent>(
      _onDeleteNotesEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
  }

  Future _onLoadNotesEvent(StreamEvent event, Emitter<StreamState> emit) async {
    emit(NoteLoading());
    final stream = firestoreService.getNotesStream();
    await emit.onEach<QuerySnapshot>(
      stream,
      onData: (snapshot) {
        emit(NotesLoaded(snapshot.docs));
      },
      onError: (error, stackTrace) {
        emit(const NoteError("Failed to load notes"));
      },
    );
  }

  Future<void> _onAddNotesEvent(
      AddNotesEvent event, Emitter<StreamState> emit) async {
    emit(NoteLoading());
    try {
      await firestoreService.addNote(event.note!);
      add(LoadNotesEvent());
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  Future<void> _onUpdateNotesEvent(
      UpdateNotesEvent event, Emitter<StreamState> emit) async {
    try {
      await firestoreService.updateNote(event.id!, event.note!);
      add(LoadNotesEvent());
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  Future<void> _onDeleteNotesEvent(
      DeleteNotesEvent event, Emitter<StreamState> emit) async {
    try {
      await firestoreService.deleteNote(event.id!);
      add(LoadNotesEvent());
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }
}
