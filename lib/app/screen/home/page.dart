import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/app/models/archetype.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/screen/home/bloc/bloc.dart';
import 'package:protiendas/app/screen/home/repository.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:protiendas/app/utils/input/input.dart';
import 'package:protiendas/app/utils/loading.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/checkbox.dart';

part 'package:protiendas/app/screen/home/_sections/body.dart';
part 'package:protiendas/app/screen/home/_sections/bottom.dart';
part 'package:protiendas/app/screen/home/_sections/builder_list.dart';
part 'package:protiendas/app/screen/home/_sections/header.dart';
part 'package:protiendas/app/screen/home/_sections/input_archetype.dart';
part 'package:protiendas/app/screen/home/_sections/item_card.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final yuGiOhHttpClient = Modular.get<XigoHttpClient>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        repository: Repository(
          yuGiOhHttpClient: yuGiOhHttpClient,
        ),
      )
        ..add(LoadListArchetypeEvent())
        ..add(LoadBanItemsEvent()),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: ProTiendasUiColors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
  if (state is LoadingListArchetypeState ||
      state is LoadingListYuGiOhByArchetypeState) {
    YuGiOhLoading.show(context);
  } else if (state is ErrorListArchetypeState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is ErrorListYuGiOhByArchetypeState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is LoadedListArchetypeState ||
      state is LoadedListYuGiOhByArchetypeState) {
    Navigator.pop(context);
  }
}
