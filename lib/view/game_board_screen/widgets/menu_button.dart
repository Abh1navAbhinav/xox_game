import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/animation_controller.dart';
import 'package:xox/controller/game_board_controller.dart';

class MenuButonWidget extends StatelessWidget {
  MenuButonWidget({
    Key? key,
  }) : super(key: key);

  final gameBoardController = Get.put(GameBoardController());
  final gameBoardController2 = Get.put(OnlyForAnimationController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem<String>(
                child: const Text('Reset'),
                onTap: () {
                  gameBoardController.resetButtonFunction();
                  gameBoardController2.resetButtonFunction();
                },
              ),
            ];
          },
          child: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
