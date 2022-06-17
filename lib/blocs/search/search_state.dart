part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final String name;
  const SearchState({required this.name});
}

//Initial state the search_bloc.
//The name search is initialed in '' (empty)
class SearchInitial extends SearchState {
  const SearchInitial() : super(name: '');
}

//State where is wrap the new state.
//The nameSearch get the new name to search.
class SetSearchState extends SearchState {
  final String nameSearch;
  const SetSearchState({required this.nameSearch}) : super(name: nameSearch);
}
