part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SetSearcEvent extends SearchEvent {
  final String name;
  SetSearcEvent(this.name);
}
