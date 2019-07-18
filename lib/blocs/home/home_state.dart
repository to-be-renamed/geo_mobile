import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class HomeTabState extends HomeState {
  final int tabIndex;

  HomeTabState(this.tabIndex) : super([tabIndex]);
}
