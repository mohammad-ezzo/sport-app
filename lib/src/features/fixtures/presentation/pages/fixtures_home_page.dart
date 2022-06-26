import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/src/core/presentation/app_loader.dart';
import 'package:sport_app/src/core/presentation/error_widget.dart';
import 'package:sport_app/src/core/presentation/size_config.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import 'package:sport_app/src/features/fixtures/presentation/bloc/fixture_bloc.dart';
import 'package:sport_app/src/service_locator.dart';

class FixturesHomePage extends StatefulWidget {
  const FixturesHomePage({Key? key}) : super(key: key);

  @override
  State<FixturesHomePage> createState() => _FixturesHomePageState();
}

class _FixturesHomePageState extends State<FixturesHomePage> {
  final FixtureBloc _bloc = FixtureBloc(locator());

  @override
  void initState() {
    super.initState();
    _bloc.add(GetFixturesEvent(leagueId: "850", season: "2022"));
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            bottom: const TabBar(
          tabs: [
            Tab(
              text: "Finished Games",
            ),
            Tab(
              text: "Upcoming Games",
            )
          ],
        )),
        body: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is LoadingFixtures) {
              return const AppLoader();
            }
            if (state is FixturesReady) {
              return TabBarView(
                  children: [buildFinishedGames(), buildUpcomingGames()]);
            }
            if (state is ErrorInFixtures) {
              return AppErrorWidget(error: state.error);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Column buildFinishedGames(List<Fixture> fixtures) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: fixtures.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(children: []),
                  );
                }))
      ],
    );
  }

  Column buildUpcomingGames(List<Fixture> fixtures) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                itemCount: fixtures.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(children: []),
                  );
                }))
      ],
    );
  }
}
