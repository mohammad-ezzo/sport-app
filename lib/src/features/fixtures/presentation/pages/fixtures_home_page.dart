import 'package:flutter/material.dart';

import '../../../../core/responsive/size_config.dart';

class FixturesHomePage extends StatefulWidget {
  const FixturesHomePage({Key? key}) : super(key: key);

  @override
  State<FixturesHomePage> createState() => _FixturesHomePageState();
}

class _FixturesHomePageState extends State<FixturesHomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container();
  }
}
