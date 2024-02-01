part of 'package:yugioh/app/screen/detail/page.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Modular.to.pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        Flexible(
          child: BlocBuilder<BlocDetail, DetailState>(
            builder: (context, state) {
              return YuGiOhText.fontSizeCustom(
                label: state.model.itemYugiOh.name,
                fontSize: 22,
                textStyle: GoogleFonts.lato(),
                textOverflow: TextOverflow.ellipsis,
              );
            },
          ),
        ),
        const SizedBox.shrink(),
      ],
    );
  }
}
