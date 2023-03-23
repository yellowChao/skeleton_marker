library skeleton_marker;

import 'package:flutter/material.dart';
import 'package:skeleton_marker/skeleton_animation.dart';


enum SkeletionShapeEnum {
  circle,// 圆型
  rectangle,//矩形
  roundedRectangle // 圆角矩形
}

extension WidgetExt<T>  on Widget {

  Widget markSkeleton({isLoading = bool, SkeletionShapeEnum shapeType = SkeletionShapeEnum.rectangle, Color fillColor = const Color(0xff81858A)}) {
    
    if (isLoading) {
      return SkeletonAnimationDecoration(
        child: Container(
          foregroundDecoration: BoxDecoration(
            borderRadius: shapeType == SkeletionShapeEnum.roundedRectangle ? BorderRadius.circular(5) : null,
            color: fillColor,
            shape: shapeType == SkeletionShapeEnum.circle ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: this
        ),
      );
    } else {
      return this;
    }
  }

}