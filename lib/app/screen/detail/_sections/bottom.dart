part of 'package:protiendas/app/screen/detail/page.dart';

class BodyBottom extends StatelessWidget {
  const BodyBottom({
    super.key,
    required this.app,
  });

  final AppConfig app;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: YuGiOhSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            YuGiOhText.small(
              label: YuGiOhUiValues.textFooter,
              textStyle: GoogleFonts.lato(),
            ),
            YuGiOhText.xSmall(
              label: '${YuGiOhUiValues.version} ${app.version}',
            ),
          ],
        ),
      ),
    );
  }
}
