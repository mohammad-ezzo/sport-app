import 'package:flutter/material.dart';
import 'package:sport_app/src/features/fixtures/domain/entities/player.dart';

class PlayerWidget extends StatelessWidget {
  const PlayerWidget({Key? key, required this.player, required this.color})
      : super(key: key);
  final Player player;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            CircleAvatar(
              child: Text(
                player.number.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white),
              ),
              backgroundColor: color,
              radius: 12,
            ),
            Expanded(
              child: Text(
                player.name ?? "",
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
