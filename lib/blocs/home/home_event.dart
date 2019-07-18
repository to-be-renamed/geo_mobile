import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class HomeTabSelectEvent extends HomeEvent {
  final int tabIndex;

  HomeTabSelectEvent(this.tabIndex) : super([tabIndex]);
}
