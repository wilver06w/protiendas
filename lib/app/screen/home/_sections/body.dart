part of 'package:protiendas/app/screen/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView(
      children: [
        const Gap(YuGiOhSpacing.md),
        Center(
          child: XigoText.title(
            label: ProTiendasUiValues.archetypes.toUpperCase(),
            color: Colors.black,
            textStyle: GoogleFonts.lato(),
          ),
        ),
        const Gap(YuGiOhSpacing.md),
        const Header(),
        BuilderList(size: size),
      ],
    );
  }
}
