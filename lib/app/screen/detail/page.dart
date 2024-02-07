import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/screen/detail/bloc/bloc.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/functions.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/button.dart';

part 'package:protiendas/app/screen/detail/_sections/body.dart';
part 'package:protiendas/app/screen/detail/_sections/bottom.dart';
part 'package:protiendas/app/screen/detail/_sections/header.dart';
part 'package:protiendas/app/screen/detail/_sections/item_card_detail.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.itemYuGiOh,
  });

  final YuGiOh itemYuGiOh;

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocDetail>(
      create: (context) => BlocDetail(
        itemYuGiOh: itemYuGiOh,
      ),
      child: Scaffold(
        backgroundColor: ProTiendasUiColors.backgroundColor,
        bottomNavigationBar: BodyBottom(app: app),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
