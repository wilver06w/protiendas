import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/app/screen/home/bloc/bloc.dart';
import 'package:protiendas/app/screen/home/repository.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:protiendas/app/utils/loading.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/protiendas_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/widget/banner.dart';
import 'package:protiendas/app/widget/card_product_vertical.dart';
import 'package:protiendas/app/widget/imagen_widget.dart';
import 'package:protiendas/app/widget/title_sections.dart';

part 'package:protiendas/app/screen/home/_sections/body.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final yuGiOhHttpClient = Modular.get<XigoHttpClient>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        repository: Repository(
          yuGiOhHttpClient: yuGiOhHttpClient,
        ),
      )
        ..add(LoadBannerEvent())
        ..add(LoadDataCategoriasEvent()),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarGlobal(
            havIconLeft: false,
            icon: const Icon(
              Icons.menu_outlined,
              color: ProTiendasUiColors.secondaryColor,
            ),
            onTapIcon: () {},
          ),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
  if (state is LoadingBannerState || state is LoadingDataCategoriasState) {
    YuGiOhLoading.show(context);
  } else if (state is ErrorBannerState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is ErrorDataCategoriasState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: ProTiendasUiColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  } else if (state is LoadedBannerState || state is LoadedDataCategoriasState) {
    Navigator.pop(context);
  }
}
