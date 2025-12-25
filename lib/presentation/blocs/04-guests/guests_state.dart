part of 'guests_bloc.dart';

enum GuestFilter { all, invited, notInvited }

/* sealed  */
class GuestsState extends Equatable {
  final GuestFilter filter;
  final List<Todo> guests;

  const GuestsState({
    this.filter = GuestFilter.all,
    this.guests = const [],
  });

  int get howManyGuest => guests.length;

  List<Todo> get filteredGuest {
    switch (filter) {
      case GuestFilter.invited:
        return guests.where((element) => element.done).toList();
      case GuestFilter.notInvited:
        return guests.where((element) => !element.done).toList();
      case GuestFilter.all:
        return guests;
      default:
        throw Exception('Filter value not valid.');
    }
  }

  int get howManyFilteredGuests => filteredGuest.length;

  GuestsState copyWith({
    GuestFilter? filter,
    List<Todo>? guests,
  }) =>
      GuestsState(
        filter: filter ?? this.filter,
        guests: guests ?? this.guests,
      );

  @override
  List<Object> get props => [filter, guests]; // se considerar si algo cambia
}

// final class GuestsInitial extends GuestsState {}
