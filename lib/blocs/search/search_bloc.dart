import 'package:bloc/bloc.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchInitial()) {
    on<SetSearcEvent>((event, emit) {
      debugPrint('event.name');
      emit(SetSearchState(nameSearch: event.name));
    });
  }
}
