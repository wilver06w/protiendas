part of 'package:yugioh/app/screen/home/page.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: YuGiOhSpacing.md),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: YuGiOhSpacing.md),
            child: Column(
              children: [
                SearchArchetype(),
                Gap(YuGiOhSpacing.md),
              ],
            ),
          ),
          SizedBox(
            height: 50,
            child: BlocBuilder<BlocHome, HomeState>(
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.model.getListArchetypeFilter.length,
                  itemBuilder: (context, index) {
                    final itemArchetype =
                        state.model.getListArchetypeFilter[index];
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(
                            YuGiOhSpacing.xs,
                          ),
                          padding: const EdgeInsets.all(
                            YuGiOhSpacing.xs,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: Colors.blue,
                          ),
                          child: Row(
                            children: [
                              YuGiOhCheckbox(
                                value: (state.model.listArchetypeSelected ?? [])
                                    .contains(
                                  itemArchetype,
                                ),
                                onChanged: (value) {
                                  context.read<BlocHome>().add(
                                        OnChangeSelectedArchetypeEvent(
                                          value: value ?? false,
                                          archetype: itemArchetype,
                                        ),
                                      );
                                },
                              ),
                              const Gap(YuGiOhSpacing.md),
                              YuGiOhText.labelText(
                                label: itemArchetype.archetypeName,
                                color: Colors.white,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
