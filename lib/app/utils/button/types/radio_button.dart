part of '../btn.dart';

class XigoRadioButton extends StatelessWidget {
  const XigoRadioButton({
    Key? key,
    this.outerCircleColor = ProTiendasUiColors.white,
    this.outerBorderCircleColor = ProTiendasUiColors.graySecondary,
    this.innerCircleColor = ProTiendasUiColors.white,
    this.outerCircleSize = 22,
    this.innerCircleSize = 9,
    this.onTap,
  }) : super(key: key);

  final Color outerCircleColor;
  final Color outerBorderCircleColor;
  final Color innerCircleColor;
  final double innerCircleSize;
  final double outerCircleSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: outerCircleSize,
        height: outerCircleSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: outerBorderCircleColor,
            width: 1,
          ),
          color: outerCircleColor,
        ),
        child: Center(
          child: Container(
            width: innerCircleSize,
            height: innerCircleSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: innerCircleColor,
            ),
          ),
        ),
      ),
    );
  }
}
