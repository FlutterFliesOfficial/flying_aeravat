import 'package:fake_fireman/readdb.dart';
import 'package:flutter/material.dart';

class manthan extends StatelessWidget {
  const manthan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: MyWidget3(),
        )
      ])),
    );
  }
}
