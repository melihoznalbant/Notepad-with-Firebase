import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stream_event.dart';
part 'stream_state.dart';

class StreamBloc extends Bloc<StreamEvent, StreamState> {
  StreamBloc() : super(StreamInitial()) {
    on<StreamEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
