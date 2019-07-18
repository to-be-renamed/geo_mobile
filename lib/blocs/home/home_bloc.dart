import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeTabState(0);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeTabSelectEvent) {
      yield HomeTabState(event.tabIndex);
    }
  }
}
