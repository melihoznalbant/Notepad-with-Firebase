import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/app/features/authentications/domain/spor_repository.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../../../../../../../../di/locator.dart';
import '../../../../../data/models/spors.dart';

part 'spors_event.dart';
part 'spors_state.dart';

class SporsBloc extends Bloc<SporsEvent, SporsState> {
  final SporsRepository sporsRepository = locator<SporsRepository>();

  SporsBloc() : super(SporsInitial()) {
    on<FetchSporsEvent>(
      _onFetchSporsEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );

    on<SporsIniEvent>(
      _onSporsIniEvent,
      transformer: (events, mapper) =>
          events.throttleTime(const Duration(seconds: 1)).asyncExpand(mapper),
    );
  }

  Future<void> _onFetchSporsEvent(
      FetchSporsEvent event, Emitter<SporsState> emit) async {
    (event, emit) async {
      emit(SporsLoadingState());
      try {
        final Spors leagueList = await sporsRepository.getSpors(event.league);
        emit(SporsLoadedState(teams: leagueList));
      } catch (e) {
        emit(SporsErrorState());
      }
    };
  }

  void _onSporsIniEvent(SporsIniEvent event, Emitter<SporsState> emit) {
    (event, emit) {
      emit(SporsInitial());
    };
  }
}
