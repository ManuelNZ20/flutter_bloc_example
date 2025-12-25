import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../../../config/config.dart';
import '../../../domain/domain.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(
          guests: [
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null,
            ),
            Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now(),
            ),
          ],
        )) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filter: event.newFilter));
    });
    on<AddGuest>(_addGuestHandler);

    on<ToggleGuest>(_toggleGuestHandler);

    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.invited));
    // });

    // on<SetNotInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.notInvited));
    // });

    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filter: GuestFilter.all));
    // });
  }

  void changeFilter(GuestFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
    // switch (newFilter) {
    //   case GuestFilter.all:
    //     add(SetAllFilterEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterEvent());
    //     break;
    //   case GuestFilter.notInvited:
    //     add(SetNotInvitedFilterEvent());
    //     break;
    // }
  }

  void addGuest(String name) => add(AddGuest(name));

  void toggleGuest(String id) => add(ToggleGuest(id));

  void _addGuestHandler(AddGuest event, Emitter<GuestsState> emit) {
    final newGuest =
        Todo(id: uuid.v4(), description: event.name, completedAt: null);
    emit(state.copyWith(guests: [...state.guests, newGuest]));
  }

  void _toggleGuestHandler(ToggleGuest event, Emitter<GuestsState> emit) {
    final events = state.filteredGuest.map((e) {
      if (e.id == event.id) {
        return e.copyWith(
          completedAt: e.completedAt == null ? DateTime.now() : null,
        );
      }
      return e;
    }).toList();
    emit(state.copyWith(guests: events));
  }
}
