import 'package:flutter/material.dart';

class Stadium extends StatelessWidget {
  const Stadium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/stadium.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
