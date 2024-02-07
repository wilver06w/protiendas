part of 'package:protiendas/app/screen/home/page.dart';

class BuilderList extends StatelessWidget {
  const BuilderList({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: YuGiOhSpacing.md),
      child: BlocBuilder<BlocHome, HomeState>(
        builder: (context, state) {
          if (state.model.getListYuGiOhWithoutBan.isEmpty) {
            return Center(
              child: XigoText.body(
                label: ProTiendasUiValues.selectArchetype,
              ),
            );
          }
          return SizedBox(
            height: size.height * 0.65,
            child: ListView.builder(
              itemCount: state.model.getListYuGiOhWithoutBan.length,
              itemBuilder: (BuildContext context, int index) {
                final itemYuGiOh = state.model.getListYuGiOhWithoutBan[index];
                return ItemCard(
                  itemYuGiOh: itemYuGiOh,
                  size: size,
                  onTap: () {
                    YuGiOhRoute.navDetail(
                      yuGiOh: itemYuGiOh,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
