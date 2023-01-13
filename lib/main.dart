import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/view/game_board_screen/game_board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameBoardScreen(),
    );
  }
}
