import 'dart:async';

import 'package:bloc_vs_cubit/business_logic/event.dart';
import 'package:bloc_vs_cubit/business_logic/repo.dart';
import 'package:bloc_vs_cubit/business_logic/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stream_transform/stream_transform.dart';

// the interval between when the user stops typing and the start of the search
Duration _duration = const Duration(milliseconds: 1000);

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (events, mapper) => events.debounce(duration).switchMap(mapper);
}

//TODO: uncomment this to use bloc

// class MyBloc extends Bloc<MyEvent, MySearchState> {
//
//   final MyRepo repo;
//
//   MyBloc({required this.repo}) : super(SearchStateInit()) {
//     on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
//   }
//
//   void _onTextChanged(TextChanged event, Emitter<MySearchState> emit) async {
//
//     final searchTerm = event.text;
//
//     if (searchTerm.isEmpty) emit(SearchStateEmpty());
//
//     emit(SearchStateLoading());
//     await repo.fetchData();
//     emit(SearchStateEmpty());
//   }
// }

//TODO: uncomment this to use cubit

class MyCubit extends Cubit<MySearchState> {

  final MyRepo repo;
  final StreamController _textChangedController = StreamController<String>();

  MyCubit({required this.repo}) : super(SearchStateInit()){
    _textChangedController.stream
        .debounce(_duration)
        .listen((text) => _emitStateAccordingToTextChanges(text));
  }

  void onTextChanged(String text) {
    _textChangedController.add(text);
  }

  void _emitStateAccordingToTextChanges(String text) async {
    if (text.isEmpty) {
      emit(SearchStateEmpty());
      return;
    }

    emit(SearchStateLoading());
    await repo.fetchData();
    emit(SearchStateEmpty());
  }

  @override
  Future<void> close() {
    _textChangedController.close();
    return super.close();
  }
}
