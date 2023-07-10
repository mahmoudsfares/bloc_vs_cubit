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

class MyBloc extends Bloc<MyEvent, MySearchState> {
  MyBloc({required this.repo}) : super(SearchStateInit()) {
    on<TextChanged>(_onTextChanged, transformer: debounce(_duration));
  }

  final MyRepo repo;

  void _onTextChanged(TextChanged event, Emitter<MySearchState> emit) async {

    final searchTerm = event.text;

    if (searchTerm.isEmpty) emit(SearchStateEmpty());

    emit(SearchStateLoading());
    await repo.fetchData();
    emit(SearchStateEmpty());
  }
}
