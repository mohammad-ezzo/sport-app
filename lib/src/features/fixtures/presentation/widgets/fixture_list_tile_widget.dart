import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/fixture.dart';

class FixtureListTileWidget extends StatelessWidget {
  const FixtureListTileWidget({
    Key? key,
    required this.fixture,
  }) : super(key: key);

  final Fixture fixture;

  @override
  Widget build(BuildContext context) {
    var goalsTextStyle =
        const TextStyle(fontWeight: FontWeight.bold, fontSize: 19);
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: Colors.white10,
      child: Column(
        children: [
          Text(DateFormat("dd-MMMM")
              .format(DateTime.parse(fixture.info?.date ?? ""))),
          Row(children: [
            CircleAvatar(
                backgroundImage: NetworkImage(fixture.teams?.home?.logo ?? "")),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Center(
                child: Text(
                  fixture.teams?.home?.name ?? "",
                  maxLines: 1,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            if (fixture.info?.isFinished ?? false)
              Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Text(
                      (fixture.goals?.home?.toString() ?? "") + " : ",
                      style: goalsTextStyle,
                    ),
                    Text(
                      fixture.goals?.away?.toString() ?? "",
                      style: goalsTextStyle,
                    )
                  ],
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
                child: Center(
              child: Text(fixture.teams?.away?.name ?? "", maxLines: 1),
            )),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
                backgroundImage: NetworkImage(fixture.teams?.away?.logo ?? ""))
          ]),
        ],
      ),
    );
  }
}
