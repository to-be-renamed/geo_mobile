import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geo_mobile/blocs/blocs.dart';
import 'package:geo_mobile/screens/home/home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => HomeBloc(),
      child: _HomeScreenTabController(),
    );
  }
}

class _HomeScreenTabController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return DefaultTabController(
      length: 4,
      child: MultiBlocListener(
        listeners: <BlocListener>[
          BlocListener(
            bloc: authBloc,
            listener: (context, state) {
              if (state is AuthSignedOutState) {
                Navigator.pushNamedAndRemoveUntil(context, "/signed-out", (_) => false);
              }
            },
          ),
          BlocListener(
            bloc: homeBloc,
            listener: (context, state) {
              if (state is HomeTabState) {
                DefaultTabController.of(context).animateTo(state.tabIndex);
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text("ToBeRenamed"),
          ),
          bottomNavigationBar: BlocBuilder(
            bloc: homeBloc,
            builder: (context, state) {
              if (state is! HomeTabState) {
                return Container();
              }

              return BottomNavigationBar(
                currentIndex: (state as HomeTabState).tabIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    title: Text("Home"),
                    icon: Icon(Icons.home),
                  ),
                  BottomNavigationBarItem(
                    title: Text("Search"),
                    icon: Icon(Icons.search),
                  ),
                  BottomNavigationBarItem(
                    title: Text("Notifications"),
                    icon: Icon(Icons.notifications),
                  ),
                  BottomNavigationBarItem(
                    title: Text("Profile"),
                    icon: Icon(Icons.account_circle),
                  )
                ],
                showUnselectedLabels: false,
                onTap: (tabIndex) => homeBloc.dispatch(HomeTabSelectEvent(tabIndex)),
              );
            },
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeTab(),
              SearchTab(),
              NotificationsTab(),
              ProfileTab(),
            ],
          ),
        ),
      ),
    );
  }
}
