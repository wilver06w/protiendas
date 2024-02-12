import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:fullscreen_image_viewer/fullscreen_image_viewer.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:protiendas/app/models/list_yugioh.dart';
import 'package:protiendas/app/screen/detail/bloc/bloc.dart';
import 'package:protiendas/app/utils/button/btn.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/config/client_config.dart';
import 'package:protiendas/app/utils/functions.dart';
import 'package:protiendas/app/utils/http/http_client.dart';
import 'package:protiendas/app/utils/responsive.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';
import 'package:protiendas/app/screen/detail/repository.dart';
import 'package:protiendas/app/widget/button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protiendas/app/widget/card_product_horizontal.dart';
import 'package:protiendas/app/widget/card_product_vertical.dart';
import 'package:protiendas/app/widget/imagen_widget.dart';
import 'package:protiendas/app/widget/title_sections.dart';

part 'package:protiendas/app/screen/detail/_sections/body.dart';
part 'package:protiendas/app/screen/detail/_sections/bottom.dart';
part 'package:protiendas/app/screen/detail/_sections/item_card_detail.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.product,
  });

  final String product;

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final xigoHttpClient = Modular.get<XigoHttpClient>();
    return BlocProvider<BlocDetail>(
      create: (context) => BlocDetail(
        repository: Repository(
          yuGiOhHttpClient: xigoHttpClient,
        ),
      )..add(LoadDataCategoriasEvent()),
      child: Scaffold(
        backgroundColor: ProTiendasUiColors.white,
        appBar: AppBarGlobal(
          onTapIcon: () {
            Modular.to.pop();
          },
        ),
        bottomNavigationBar: BodyBottom(app: app),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}
