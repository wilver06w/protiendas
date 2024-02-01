import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yugioh/app/utils/responsive.dart';
import 'package:yugioh/app/utils/spacing.dart';
import 'package:yugioh/app/utils/yugioh_ui.dart';

class YuGiOhLoading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            YuGiOhUiValues.loadingAnimations,
            height: YuGiOhResponsive.heightSizeByContext(
              context,
              pixels: YuGiOhSpacing.xs,
            ),
            width: YuGiOhResponsive.withSizeByContext(
              context,
              pixels: YuGiOhSpacing.xs,
            ),
          ),
        );
      },
    );
  }
}
