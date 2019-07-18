import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';

class CustomTabBarView extends StatefulWidget {
  final List<Widget> children;

  CustomTabBarView({@required this.children});

  @override
  State<StatefulWidget> createState() => CustomTabBarViewState(children: children);
}

class CustomTabBarViewState extends State<CustomTabBarView> {
  final List<Widget> children;

  CustomTabBarViewState({@required this.children});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    DefaultTabController.of(context).addListener(_onTabSelect);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: children);
  }

  void _onTabSelect() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final tabController = DefaultTabController.of(context);

    homeBloc.dispatch(HomeTabSelectEvent(tabController.index));
  }
}
