import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

enum AnimationTrigger {
  onPageLoad,
  onActionTrigger,
}

class AnimationInfo {
  AnimationInfo({
    required this.trigger,
    required this.effects,
    this.applyInitialState = true,
  });
  final AnimationTrigger trigger;
  final List<Effect<dynamic>> effects;
  final bool applyInitialState;
  late Adapter adapter;
  late AnimationController controller;
}

void createAnimation(AnimationInfo animation, TickerProvider vsync) {
  final newController = AnimationController(vsync: vsync);
  animation.controller = newController;
  animation.adapter = Adapter()..init(newController);
}

void setupAnimations(Iterable<AnimationInfo> animations, TickerProvider vsync) {
  animations.forEach((animation) => createAnimation(animation, vsync));
}

extension AnimatedWidgetExtension on Widget {
  Widget animateOnPageLoad(AnimationInfo animationInfos) => Animate(
        controller:
            animationInfos.applyInitialState ? null : animationInfos.controller,
        adapter:
            animationInfos.applyInitialState ? null : animationInfos.adapter,
        effects: animationInfos.effects,
        child: this,
      );

  Widget animateOnActionTrigger(
    AnimationInfo animationInfo, {
    bool hasBeenTriggered = false,
  }) =>
      hasBeenTriggered || animationInfo.applyInitialState
          ? Animate(
              controller: animationInfo.controller,
              adapter: animationInfo.adapter,
              effects: animationInfo.effects,
              child: this)
          : this;
}
