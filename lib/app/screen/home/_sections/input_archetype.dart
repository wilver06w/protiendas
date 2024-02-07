part of 'package:protiendas/app/screen/home/page.dart';

class SearchArchetype extends StatelessWidget {
  const SearchArchetype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, HomeState>(
      builder: (context, state) {
        return XigoTextField(
          controller: null,
          hintText: ProTiendasUiValues.searchArchetype,
          fillColor: Colors.white,
          filled: true,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return '${ProTiendasUiValues.searchArchetype} ${ProTiendasUiValues.onRequired}';
            }
            return null;
          },
          onChanged: (value) {
            context.read<BlocHome>().add(
                  SearchItemEvent(
                    archetype: Archetype(
                      archetypeName: value,
                    ),
                  ),
                );
          },
        );
      },
    );
  }
}
