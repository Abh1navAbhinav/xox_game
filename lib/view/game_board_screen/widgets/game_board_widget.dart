import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/animation_controller.dart';
import 'package:xox/controller/game_board_controller.dart';
import 'package:xox/view/game_board_screen/widgets/single_game_board_piece_widget.dart';

class GameBoardWidget extends StatelessWidget {
  GameBoardWidget({
    Key? key,
  }) : super(key: key);
  final GameBoardController oAnimationController = Get.find();
  final OnlyForAnimationController xAnimationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              oAnimationController.boardOnTap(index);
              xAnimationController.animationcontrollerOntapFunction();
            },
            child: SingleGameBoardPieceWidget(index: index),
          );
        },
      ),
    );
  }
}
