part of 'search_bloc.dart';

@immutable
abstract class SearchState {
  final String name;
  const SearchState({required this.name});
}

class SearchInitial extends SearchState {
  const SearchInitial() : super(name: '');
}

class SetSearchState extends SearchState {
  final String nameSearch;
  const SetSearchState({required this.nameSearch}) : super(name: nameSearch);
}
