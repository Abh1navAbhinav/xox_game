import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/controller/animation_controller.dart';
import 'package:xox/controller/game_board_controller.dart';
import 'package:xox/view/game_board_screen/widgets/game_board_widget.dart';
import 'package:xox/view/game_board_screen/widgets/menu_button.dart';
import 'package:xox/view/game_board_screen/widgets/player_avatar.dart';

class GameBoardScreen extends StatelessWidget {
  GameBoardScreen({super.key});
  final gameBoardController = Get.put(GameBoardController());
  final gameBoardController2 = Get.put(OnlyForAnimationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          MenuButonWidget(),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.852,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PlayerAvatar(
                  animationController: gameBoardController.oAnimationController,
                  player: 'O',
                ),
                GameBoardWidget(),
                PlayerAvatar(
                  animationController:
                      gameBoardController2.xAnimationController,
                  player: 'X',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
