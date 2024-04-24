import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_api_bloc/data/spor_repository.dart';
import '../../locator.dart';
import '../../models/spors.dart';

part 'spors_event.dart';
part 'spors_state.dart';

class SporsBloc extends Bloc<SporsEvent, SporsState> {

  final SporsRepository sporsRepository = locator<SporsRepository>();

  SporsBloc() : super(SporsInitial()) {
    on<FetchSporsEvent>((event, emit) async{
      emit(SporsLoadingState());
      try {
        final Spors leagueList = await sporsRepository.getSpors(event.league);
        emit(SporsLoadedState(teams: leagueList));
      } catch (e) {
        emit(SporsErrorState());
      }
    },
    );

    on<SporsIniEvent>((event, emit) async{
      emit(SporsInitial());
    },
    );
  }
}
