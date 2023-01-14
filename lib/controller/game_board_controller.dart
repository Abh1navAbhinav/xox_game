import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xox/constants/colors.dart';

class GameBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
//-----------------------------------variables

  RxList<String> element = List.filled(9, '').obs;
  RxList<Color> boxColors = List.filled(9, Colors.white).obs;

  String prevElement = 'O';
  int count = 0;

  late AnimationController oAnimationController;

//-----------------------------------onInit function

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

//-----------------------------------onClose function

  @override
  void onClose() {
    super.onClose();
    oAnimationController.dispose();
  }

//-----------------------------------adding 'x and 'o' every time user tap on board function

  void boardOnTap(int index) {
    if (element[index] == '') {
      prevElement == 'X' ? element[index] = 'O' : element[index] = 'X';
      prevElement = element[index];
      xAnimation = !xAnimation;
      if (xAnimation) {
        oAnimationController.stop();
      } else {
        oAnimationController.forward();
        oAnimationController.repeat();
      }
      count++;
    }
//calling functions
    var result = checkWin(element[index]);
    changeColor(result);
  }

//-----------------------------------Change color of the board when wins or match draw function

  void changeColor(List<int>? result) {
    if (result != null) {
      if (result[2] != 0) {
        boxColors[result[0]] = Colors.green;
        boxColors[result[1]] = Colors.green;
        boxColors[result[2]] = Colors.green;
      } else {
        boxColors.replaceRange(
          0,
          boxColors.length,
          List.filled(
            boxColors.length,
            Colors.red.withOpacity(0.3),
          ),
        );
      }
    }
  }

//-----------------------------------Reset Button OnTap function

  void resetButtonFunction() {
    boxColors.replaceRange(
      0,
      boxColors.length,
      List.filled(
        boxColors.length,
        Colors.white,
      ),
    );
    element.replaceRange(0, element.length, List.filled(9, ''));
    prevElement = 'O';
    count = 0;
    oAnimationController.stop();
    xAnimation = true;
  }

//-----------------------------------Checking if anyone win the match every time user tap the board function

  List<int>? checkWin(String v) {
    if (element[0] == v && element[1] == v && element[2] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');
      return [0, 1, 2];
    } else if (element[0] == v && element[3] == v && element[6] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [0, 3, 6];
    } else if (element[0] == v && element[4] == v && element[8] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [0, 4, 8];
    } else if (element[1] == v && element[4] == v && element[7] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [1, 4, 7];
    } else if (element[2] == v && element[5] == v && element[8] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [2, 5, 8];
    } else if (element[2] == v && element[4] == v && element[6] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [2, 4, 6];
    } else if (element[6] == v && element[7] == v && element[8] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [6, 7, 8];
    } else if (element[3] == v && element[4] == v && element[5] == v) {
      Get.snackbar('Won', v == 'X' ? 'player one wins' : 'player two wins');

      return [3, 4, 5];
    } else if (count == 9) {
      Get.snackbar('Game over', 'Match draw');

      return [0, 0, 0];
    }
    return null;
  }

//-----------------------------------oninit calling  function

  void initialize() {
    oAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
  }
}
