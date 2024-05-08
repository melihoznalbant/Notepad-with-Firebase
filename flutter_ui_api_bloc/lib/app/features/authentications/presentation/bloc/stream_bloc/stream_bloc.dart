import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/data/models/note_model.dart';
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

  Future _onLoadNotesEvent(
      LoadNotesEvent event, Emitter<StreamState> emit) async {
    emit(NoteLoading());

    await emit.forEach<QuerySnapshot>(
      firestoreService.getNotesStream(),
      onData: (snapshot) {
        return NotesLoaded(snapshot.docs.map((e) {
          DocumentSnapshot document = e;
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          return NoteModel(note: data["note"].toString(), docId: document.id);
        }).toList());
      },
      onError: (error, stackTrace) {
        return const NoteError("Failed to load notes");
      },
    );
  }

  Future<void> _onAddNotesEvent(
      AddNotesEvent event, Emitter<StreamState> emit) async {
    emit(NoteLoading());
    try {
      await firestoreService.addNote(event.note!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  Future<void> _onUpdateNotesEvent(
      UpdateNotesEvent event, Emitter<StreamState> emit) async {
    try {
      await firestoreService.updateNote(event.id!, event.note!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }

  Future<void> _onDeleteNotesEvent(
      DeleteNotesEvent event, Emitter<StreamState> emit) async {
    try {
      await firestoreService.deleteNote(event.id!);
    } catch (e) {
      emit(const NoteError("Failed to load notes"));
    }
  }
}
