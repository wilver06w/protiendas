part of 'package:protiendas/app/screen/dashboard/page.dart';

class ItemDashboard extends StatelessWidget {
  const ItemDashboard({
    super.key,
    required this.position,
    required this.title,
    required this.routeImage,
    required this.routeIconSelected,
    required this.onTap,
    this.isSelected = false,
  });

  final int position;
  final String title;
  final String routeImage;
  final String routeIconSelected;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            isSelected ? routeIconSelected : routeImage,
          ),
          XigoTextMedium(
            title,
          ),
        ],
      ),
    );
  }
}
