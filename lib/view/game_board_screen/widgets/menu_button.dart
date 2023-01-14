import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/game_board_controller.dart';

class MenuButonWidget extends GetView<GameBoardController> {
  const MenuButonWidget({
    Key? key,
  }) : super(key: key);

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
                  controller.resetButtonFunction();
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
