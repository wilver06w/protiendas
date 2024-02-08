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
        BlocBuilder<BlocHome, HomeState>(
          builder: (context, state) {
            if (state.model.dataBanner == null) {
              return const SizedBox.shrink();
            }
            return ViewBanner(
              size: size,
              mobile: state.model.dataBanner?.data.mobile ?? [],
            );
          },
        ),
        BlocBuilder<BlocHome, HomeState>(
          builder: (context, state) {
            if (state.model.dataBanner == null) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              height: 100,
              child: BlocBuilder<BlocHome, HomeState>(
                builder: (context, state) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: YuGiOhSpacing.sm,
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                'https://img.freepik.com/foto-gratis/gato-rojo-o-blanco-i-estudio-blanco_155003-13189.jpg?w=360&t=st=1707431887~exp=1707432487~hmac=4f842955cc47805a82701a1de5cce2c5c3ce945c432ee45d645aeaa38e85eb98',
                              ),
                            ),
                            Gap(YuGiOhSpacing.sl),
                            XigoTextSmall(
                              ProTiendasUiValues.amazon,
                              color: ProTiendasUiColors.primaryColor,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
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
