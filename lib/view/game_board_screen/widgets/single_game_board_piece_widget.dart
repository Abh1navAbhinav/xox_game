import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/game_board_controller.dart';

class SingleGameBoardPieceWidget extends GetView<GameBoardController> {
  const SingleGameBoardPieceWidget({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 0.8,
          ),
          color: controller.boxColors[index],
        ),
        height: 100,
        width: 100,
        child: Center(
          child: Obx(
            () => Text(
              controller.element[index],
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
