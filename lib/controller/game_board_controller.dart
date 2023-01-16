import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameBoardController extends GetxController
    with GetSingleTickerProviderStateMixin {
//-----------------------------------variables

  RxList<String> element = List.filled(9, '').obs;
  RxList<Color> boxColors = List.filled(9, Colors.white).obs;

  RxString prevElement = 'O'.obs;
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
      prevElement.value == 'X' ? element[index] = 'O' : element[index] = 'X';
      prevElement.value = element[index];

      count++;
    }
//calling functions
    var result = checkWin(element[index]);
    changeColor(result, element[index]);
  }

//-----------------------------------Change color of the board when wins or match draw function

  Future<void> changeColor(List<int>? result, String v) async {
    if (result != null) {
      if (result[2] != 0) {
        boxColors[result[0]] = Colors.green.withOpacity(0.3);
        boxColors[result[1]] = Colors.green.withOpacity(0.3);
        boxColors[result[2]] = Colors.green.withOpacity(0.3);
        await Future.delayed(const Duration(milliseconds: 200));
        alertBoxMethod(v: v);
      } else {
        boxColors.replaceRange(
          0,
          boxColors.length,
          List.filled(
            boxColors.length,
            Colors.red.withOpacity(0.3),
          ),
        );
        await Future.delayed(const Duration(milliseconds: 200));

        alertBoxMethod(v: v, win: false);
      }
    }
  }

//-----------------------------------alert box  function

  Future<dynamic> alertBoxMethod({required String v, bool? win = true}) {
    return Get.defaultDialog(
      title: win == false ? 'Game Over' : 'Congratulations',
      middleText: win == false
          ? 'Match become tie'
          : (v == 'X' ? "player 'X' wins" : "player 'O' wins"),
      barrierDismissible: false,
      onWillPop: () => willPopCallback(),
      confirmTextColor: Colors.white,
      confirm: InkWell(
        onTap: () {
          resetButtonFunction();
          Get.back();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Replay'),
          ),
        ),
      ),
    );
  }

//-----------------------------------on will pop call back function function

  Future<bool> willPopCallback() async {
    resetButtonFunction();
    log('message');
    return true; //
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
    prevElement.value = 'O';
    count = 0;
  }

//-----------------------------------Checking if anyone win the match every time user tap the board function

  List<int>? checkWin(String v) {
    if (element[0] == v && element[1] == v && element[2] == v) {
      return [0, 1, 2];
    } else if (element[0] == v && element[3] == v && element[6] == v) {
      return [0, 3, 6];
    } else if (element[0] == v && element[4] == v && element[8] == v) {
      return [0, 4, 8];
    } else if (element[1] == v && element[4] == v && element[7] == v) {
      return [1, 4, 7];
    } else if (element[2] == v && element[5] == v && element[8] == v) {
      return [2, 5, 8];
    } else if (element[2] == v && element[4] == v && element[6] == v) {
      return [2, 4, 6];
    } else if (element[6] == v && element[7] == v && element[8] == v) {
      return [6, 7, 8];
    } else if (element[3] == v && element[4] == v && element[5] == v) {
      return [3, 4, 5];
    } else if (count == 9) {
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
    oAnimationController.forward();
    oAnimationController.repeat();
  }
}
