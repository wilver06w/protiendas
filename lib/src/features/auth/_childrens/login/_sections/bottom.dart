part of 'package:protiendas/src/features/auth/_childrens/login/page.dart';

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
        padding: const EdgeInsets.symmetric(vertical: ProTiendaSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            XigoText.small(
              label: ProTiendasUiValues.textFooter,
              textStyle: GoogleFonts.lato(),
            ),
            XigoText.xSmall(
              label: '${ProTiendasUiValues.version} ${app.version}',
            ),
          ],
        ),
      ),
    );
  }
}
