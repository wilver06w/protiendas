part of 'package:yugioh/app/screen/home/page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.itemYuGiOh,
    required this.size,
    required this.onTap,
  });

  final YuGiOh? itemYuGiOh;
  final Size size;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: Colors.grey,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        margin: const EdgeInsets.only(bottom: YuGiOhSpacing.sm),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: Colors.grey,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
          padding: const EdgeInsets.all(YuGiOhSpacing.xs),
          margin: const EdgeInsets.all(YuGiOhSpacing.sm),
          child: Stack(
            children: [
              Image.asset(
                YuGiOhUiValues.backBlueImg,
              ),
              Positioned.fill(
                child: Row(
                  children: [
                    Hero(
                      tag: itemYuGiOh?.cardImages?[0].imageUrlCropped ?? '',
                      child: Image.network(
                        itemYuGiOh?.cardImages?[0].imageUrlCropped ?? '',
                        height: size.height * 0.4,
                        width: size.width * 0.4,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Gap(YuGiOhSpacing.md),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          YuGiOhText.fontSizeCustom(
                            label: itemYuGiOh?.name ?? '',
                            fontSize: 20,
                            textStyle: GoogleFonts.lateef(),
                            color: Colors.white,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          YuGiOhText.body(
                            label: itemYuGiOh?.race ?? '',
                            color: Colors.white,
                            textStyle: GoogleFonts.lateef(),
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          YuGiOhText.body(
                            label:
                                '${YuGiOhUiValues.type}: ${itemYuGiOh?.type ?? 0}',
                            color: Colors.white,
                            textStyle: GoogleFonts.lateef(),
                            textOverflow: TextOverflow.ellipsis,
                          ),
                          YuGiOhText.body(
                            label:
                                '${YuGiOhUiValues.atk}: ${itemYuGiOh?.atk ?? 0}',
                            color: Colors.white,
                            textStyle: GoogleFonts.lateef(),
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
