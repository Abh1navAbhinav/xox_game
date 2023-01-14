import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:xox/constants/colors.dart';

class OnlyForAnimationController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController xAnimationController;

//-----------------------------------onInit function

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

//-----------------------------------initialize function

  void initialize() {
    xAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    xAnimationController.forward();
    xAnimationController.repeat();
  }

//-----------------------------------onClose function

  @override
  void onClose() {
    super.onClose();
    xAnimationController.dispose();
  }

//-----------------------------------animationControllre function

  void animationcontrollerOntapFunction() {
    if (xAnimation) {
      xAnimationController.forward();
      xAnimationController.repeat();
    } else {
      xAnimationController.stop();
    }
  }

//-----------------------------------reset button function

  void resetButtonFunction() {
    xAnimationController.forward();
    xAnimationController.repeat();
    xAnimation = true;
  }
}
