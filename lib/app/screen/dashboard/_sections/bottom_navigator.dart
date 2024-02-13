part of 'package:protiendas/app/screen/dashboard/page.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: YuGiOhSpacing.sl,
        vertical: YuGiOhSpacing.sl,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: ProTiendasUiColors.cultured,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemDashboard(
                position: 0,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 0,
                        ),
                      );
                },
                isSelected: true,
                title: ProTiendasUiValues.start,
                routeImage: ProTiendasUiValues.icHome,
                routeIconSelected: ProTiendasUiValues.icMyProfile,
              ),
              ItemDashboard(
                position: 1,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 1,
                        ),
                      );
                },
                title: ProTiendasUiValues.favorites,
                routeImage: ProTiendasUiValues.icBells,
                routeIconSelected: ProTiendasUiValues.icMyProfile,
              ),
              ItemDashboard(
                position: 2,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 2,
                        ),
                      );
                },
                title: ProTiendasUiValues.notifications,
                routeImage: ProTiendasUiValues.icBells,
                routeIconSelected: ProTiendasUiValues.icMyProfile,
              ),
              ItemDashboard(
                position: 3,
                onTap: () {
                  context.read<BlocDashboard>().add(
                        const ChangePositionEvent(
                          position: 3,
                        ),
                      );
                },
                title: ProTiendasUiValues.myProfile,
                routeImage: ProTiendasUiValues.icMyProfile,
                routeIconSelected: ProTiendasUiValues.icMyProfile,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
