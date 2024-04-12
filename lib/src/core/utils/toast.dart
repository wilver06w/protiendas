import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';

class ProTToast {
  static void close() => dismissAllToast(showAnim: true);

  static ToastFuture showToast({
    required String message,
    Color? backgroundColor,
    Color textColor = ProTiendasUiColors.white,
    int? seconds,
    void Function()? onDimiss,
    required double positionOffset,
    required AlignmentGeometry positionAlign,
    TextAlign? textAlign,
  }) =>
      _showToast(
        title: message,
        icon: null,
        borderColor: backgroundColor ?? ProTiendasUiColors.pigmentGreen,
        backgroundColor: backgroundColor ?? ProTiendasUiColors.pigmentGreen,
        seconds: seconds,
        onDimiss: onDimiss,
        positionOffset: positionOffset,
        alignment: positionAlign,
        textAlign: textAlign,
      );

  static ToastFuture showLongSuccess(
    String title, {
    required String description,
    bool showSuccessIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        description: description,
        fontSize: 16.0,
        borderColor: ProTiendasUiColors.lemonLight,
        backgroundColor: ProTiendasUiColors.pigmentGreen,
        icon: (showSuccessIcon || showIcons) ? 'success_text_long.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showShortSuccess(
    String title, {
    bool showSuccessIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        borderColor: ProTiendasUiColors.lemonLight,
        backgroundColor: ProTiendasUiColors.pigmentGreen,
        icon: (showSuccessIcon || showIcons) ? 'success_text_short.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showLongError(
    String title, {
    required String description,
    bool showErrorIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        description: description,
        fontSize: 16.0,
        borderColor: ProTiendasUiColors.dangerColor,
        backgroundColor: ProTiendasUiColors.dangerColor,
        icon: (showErrorIcon || showIcons) ? 'error_text_long.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showShortError(
    String title, {
    bool showErrorIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        borderColor: ProTiendasUiColors.dangerColor,
        backgroundColor: ProTiendasUiColors.dangerColor,
        icon: (showErrorIcon || showIcons) ? 'error_text_short.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showLongInfo(
    String title, {
    required String description,
    bool showInfoIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        description: description,
        fontSize: 16.0,
        borderColor: ProTiendasUiColors.informationDark,
        backgroundColor: ProTiendasUiColors.information,
        icon: (showInfoIcon || showIcons) ? 'info_text_long.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showShortInfo(
    String title, {
    bool showInfoIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        borderColor: ProTiendasUiColors.informationDark,
        backgroundColor: ProTiendasUiColors.information,
        icon: (showInfoIcon || showIcons) ? 'info_text_short.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showLongWarning(
    String title, {
    required String description,
    bool showWarningIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        description: description,
        fontSize: 16.0,
        borderColor: ProTiendasUiColors.philippineYellow,
        backgroundColor: ProTiendasUiColors.deepSaffron,
        icon: (showWarningIcon || showIcons) ? 'warning_text_long.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture showShortWarning(
    String title, {
    bool showWarningIcon = false,
    bool showCloseIcon = false,
    bool showIcons = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
  }) =>
      _showToast(
        title: title,
        borderColor: ProTiendasUiColors.philippineYellow,
        backgroundColor: ProTiendasUiColors.deepSaffron,
        icon: (showWarningIcon || showIcons) ? 'warning_text_short.svg' : null,
        showCloseIcon: (showCloseIcon || showIcons),
        seconds: seconds,
        positionOffset: positionOffset,
        alignment: alignment,
        onDimiss: onDimiss,
      );

  static ToastFuture _showToast({
    required String title,
    String? description,
    double fontSize = 14.0,
    required String? icon,
    required Color borderColor,
    required Color backgroundColor,
    bool showCloseIcon = false,
    int? seconds,
    double? positionOffset,
    AlignmentGeometry? alignment,
    VoidCallback? onDimiss,
    TextAlign? textAlign,
  }) {
    // final app = Modular.get<AppConfig>();
    return showToastWidget(
      GestureDetector(
        child: Container(
          margin: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 25.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 11.0,
                  ),
                  child: SvgPicture.asset('assets/icons/utils/$icon'),
                ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: XigoText.fontSizeCustom(
                            label: title,
                            fontWeight: FontWeight.w400,
                            color: ProTiendasUiColors.white,
                            fontSize: fontSize,
                            letterSpacing: -0.6,
                            textAlign: textAlign,
                          ),
                        ),
                        Visibility(
                          visible: showCloseIcon,
                          child: SvgPicture.asset(
                            'assets/icons/utils/close_toast.svg',
                          ),
                        ),
                      ],
                    ),
                    if (description != null)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 7.0,
                        ),
                        child: XigoText.labelText(
                          label: description,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: -0.6,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () => dismissAllToast(showAnim: true),
      ),
      onDismiss: onDimiss,
      handleTouch: true,
      dismissOtherToast: true,
      duration: Duration(seconds: seconds ?? 7),
      position: ToastPosition(
        offset: (alignment == Alignment.topCenter)
            ? positionOffset ?? 75.0
            : positionOffset ?? -60.0,
        align: alignment ?? Alignment.bottomCenter,
      ),
    );
  }
}
