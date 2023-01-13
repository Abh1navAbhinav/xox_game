import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/game_board_controller.dart';
import 'package:xox/view/game_board_screen/widgets/game_board_widget.dart';

class GameBoardScreen extends GetView<GameBoardController> {
  GameBoardScreen({super.key});
  final gameBoardController = Get.put(GameBoardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const GameBoardWidget(),
              ElevatedButton(
                onPressed: () => controller.resetButtonFunction(),
                child: const Text(
                  'Reset',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
