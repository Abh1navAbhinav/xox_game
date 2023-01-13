import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameBoardController extends GetxController {
//-----------------------------------variables

  RxList<String> element = List.filled(9, '').obs;
  RxList<Color> boxColors = List.filled(9, Colors.white).obs;

  String prevElement = 'O';
  int count = 0;

//-----------------------------------Board OnTap function

  void boardOnTap(int index) {
    log('$index');

    if (element[index] == '') {
      prevElement == 'X' ? element[index] = 'O' : element[index] = 'X';
      prevElement = element[index];
    }
    count++;
    var result = checkWin(element[index]);
    if (result != null) {
      boxColors[result[0]] = Colors.green;
      boxColors[result[1]] = Colors.green;
      boxColors[result[2]] = Colors.green;
    }
    log(result.toString());
  }

//-----------------------------------Reset Button OnTap function

  void resetButtonFunction() {
    element.replaceRange(0, element.length, List.filled(9, ''));
    prevElement = 'O';
    count = 0;
    boxColors.replaceRange(
      0,
      boxColors.length,
      List.filled(
        boxColors.length,
        Colors.white,
      ),
    );
  }

//-----------------------------------Check win function

  List<int>? checkWin(String v) {
    if (element[0] == v && element[1] == v && element[2] == v) {
      Get.snackbar(
        'Won',
        v == 'X' ? 'player one wins' : 'player two wins',
        backgroundGradient: const LinearGradient(
          colors: [
            Colors.green,
            Colors.greenAccent,
          ],
        ),
      );
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

      return [];
    }
    return null;
  }
}
