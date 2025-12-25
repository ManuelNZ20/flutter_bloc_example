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
