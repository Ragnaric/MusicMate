import 'package:flutter/material.dart';
import 'package:music_mate/common/common.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CDrawer(),
      appBar: const CAppBar(title: 'Music Mate'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('Click here'),
          ),
        ],
      ),
    );
  }
}
