part of 'package:protiendas/app/screen/home/page.dart';

class SearchArchetype extends StatelessWidget {
  const SearchArchetype({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocHome, HomeState>(
      builder: (context, state) {
        return YuGiOhTextField(
          controller: null,
          hintText: YuGiOhUiValues.searchArchetype,
          fillColor: Colors.white,
          filled: true,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return '${YuGiOhUiValues.searchArchetype} ${YuGiOhUiValues.onRequired}';
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
