import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:protiendas/app/utils/responsive.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';

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
            ProTiendasUiValues.loadingAnimations,
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
