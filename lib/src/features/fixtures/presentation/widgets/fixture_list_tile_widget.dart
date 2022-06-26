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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
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
        Column(
          children: [
            Row(
              children: [
                Text((fixture.goals?.home?.toString() ?? "") + " : "),
                Text(fixture.goals?.away?.toString() ?? "")
              ],
            ),
            Text(DateFormat("dd-MMMM")
                .format(DateTime.parse(fixture.info?.date ?? ""))),
          ],
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
    );
  }
}
