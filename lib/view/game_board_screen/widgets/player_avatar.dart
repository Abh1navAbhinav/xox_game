import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xox/constants/colors.dart';
import 'package:xox/controller/game_board_controller.dart';

class PlayerAvatar extends GetView<GameBoardController> {
  const PlayerAvatar({
    Key? key,
    required this.player,
  }) : super(key: key);
  final String player;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: Obx(
        () => AnimatedOpacity(
          duration: const Duration(milliseconds: 450),
          opacity: controller.prevElement.value == player ? 0 : 1,
          child: Stack(
            children: [
              RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(
                  controller.oAnimationController,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 86,
                    width: 86,
                    decoration: BoxDecoration(
                      gradient: ConstantColors.familiarGradient,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                top: 20,
                left: 20,
                right: 20,
                child: AnimatedPhysicalModel(
                  shape: BoxShape.circle,
                  elevation: controller.prevElement.value == player ? 0 : 5,
                  color: Colors.transparent,
                  shadowColor: Colors.red,
                  duration: const Duration(milliseconds: 600),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Text(
                      player,
                      style: GoogleFonts.sriracha(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
