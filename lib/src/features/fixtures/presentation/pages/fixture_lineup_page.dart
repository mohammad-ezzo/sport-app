import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/src/core/presentation/app_loader.dart';
import 'package:sport_app/src/core/presentation/error_widget.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/lineup.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/starxi.dart';
import 'package:sport_app/src/features/fixtures/presentation/widgets/fixture_list_tile_widget.dart';
import 'package:sport_app/src/features/fixtures/presentation/widgets/player_widget.dart';
import 'package:sport_app/src/features/fixtures/presentation/widgets/stadium_widget.dart';

import '../bloc/fixture_bloc.dart';

class LineupPage extends StatefulWidget {
  const LineupPage({Key? key, required this.fixture}) : super(key: key);
  final Fixture fixture;
  static const String routeName = "/fixture_lineup";
  @override
  State<LineupPage> createState() => _LineupPageState();
}

class _LineupPageState extends State<LineupPage> {
  @override
  void didChangeDependencies() {
    //! this the only fixture that i find that return a formation .
    BlocProvider.of<FixtureBloc>(context)
        .add(GetLineupsEvent(fixtureId: "592872"));
    // BlocProvider.of<FixtureBloc>(context)
    //     .add(GetLineupsEvent(fixtureId: widget.fixture.info!.id.toString()));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lineups"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: Column(
        children: [
          FixtureListTileWidget(fixture: widget.fixture),
          Expanded(
              child: Stack(children: [
            const Stadium(),
            BlocBuilder<FixtureBloc, FixtureState>(
              builder: (context, state) {
                if (state is LineupsReady) {
                  if (state.lineups.isNotEmpty) {
                    return Column(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              if (state.lineups[0].formation != null)
                                ...getLineupFormation(state.lineups[0])
                                    .map((list) => Expanded(
                                          child: Row(
                                            children: [
                                              ...list
                                                  .map(
                                                    (e) => PlayerWidget(
                                                      player: e.player!,
                                                      color: Colors.indigo,
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ),
                                        ))
                                    .toList()
                              else
                                buildNoFormation()
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              if (state.lineups[1].formation != null)
                                ...getLineupFormation(state.lineups[1])
                                    .map((list) => Expanded(
                                          child: Row(
                                            children: [
                                              ...list
                                                  .map(
                                                    (e) => PlayerWidget(
                                                      player: e.player!,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                  .toList()
                                            ],
                                          ),
                                        ))
                                    .toList()
                              else
                                buildNoFormation()
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return buildNoFormation();
                }
                if (state is LoadingLineups) {
                  return const AppLoader();
                }
                if (state is ErrorInLineups) {
                  return AppErrorWidget(error: state.error);
                }

                return const SizedBox();
              },
              buildWhen: (prev, curr) =>
                  curr is LoadingLineups ||
                  curr is LineupsReady ||
                  curr is ErrorInLineups,
            )
          ]))
        ],
      )),
    );
  }

  Column buildNoFormation() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: Text(
            "No Formation",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
          ),
        ),
      ],
    );
  }

  // static filling for formations X-X-X and X-X-X-X
  List<List<StartXI>> getLineupFormation(Lineup lineup) {
    final splitted = lineup.formation!.split("-");
    List<List<StartXI>>? result;
    //X_X_X
    if (splitted.length == 3) {
      result = [
        [lineup.startXI![0]],
        [],
        [],
        [],
      ];
      int curser = 1;
      for (var i = curser; i <= int.parse(splitted[0]) + curser - 1; i++) {
        result[1].add(lineup.startXI![i]);
      }
      curser += int.parse(splitted[0]);
      for (var i = curser; i <= int.parse(splitted[1]) + curser - 1; i++) {
        result[2].add(lineup.startXI![i]);
      }
      curser += int.parse(splitted[1]);

      for (var i = curser; i <= int.parse(splitted[2]) + curser - 1; i++) {
        if (i < lineup.startXI!.length) result[3].add(lineup.startXI![i]);
      }
      return result;
      // X_X_X_X
    } else if (splitted.length == 4) {
      result = [
        [lineup.startXI![0]],
        [],
        [],
        [],
        []
      ];
      int curser = 1;
      for (var i = curser; i <= int.parse(splitted[0]) + curser - 1; i++) {
        result[1].add(lineup.startXI![i]);
      }
      curser += int.parse(splitted[0]);
      for (var i = curser; i <= int.parse(splitted[1]) + curser - 1; i++) {
        result[2].add(lineup.startXI![i]);
      }
      curser += int.parse(splitted[1]);

      for (var i = curser; i <= int.parse(splitted[2]) + curser - 1; i++) {
        result[3].add(lineup.startXI![i]);
      }
      curser += int.parse(splitted[2]);

      for (var i = curser; i <= int.parse(splitted[3]) + curser - 1; i++) {
        if (i < lineup.startXI!.length) result[4].add(lineup.startXI![i]);
      }
      return result.reversed.toList();
    }
    return [];
  }
}
