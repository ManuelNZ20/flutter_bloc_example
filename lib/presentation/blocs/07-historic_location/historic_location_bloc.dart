import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(HistoricLocationState()) {
    on<NewLocation>(_onNewLocationHandler);

    // on<HistoricLocationEvent>((event, emit) {
    //   // TODO: implement event handler
    // });
  }

  void onNewUserLocation((double lat, double lng) location) {
    print(state.locations.length);
    add(NewLocation(location));
  }

  void _onNewLocationHandler(
      NewLocation event, Emitter<HistoricLocationState> emit) {
    emit(state.copyWith(
      locations: [...state.locations, event.location],
    ));
  }
}
