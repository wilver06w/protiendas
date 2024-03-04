import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:protiendas/src/core/utils/constant/responsive.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';

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
              pixels: ProTiendaSpacing.xs,
            ),
            width: YuGiOhResponsive.withSizeByContext(
              context,
              pixels: ProTiendaSpacing.xs,
            ),
          ),
        );
      },
    );
  }
}
