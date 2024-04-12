import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:protiendas/src/features/payment_method/add/bloc/bloc.dart';
import 'package:protiendas/src/shared/widget/button/btn.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/helpers/formatter.dart';
import 'package:protiendas/src/core/utils/helpers/input/input.dart';
import 'package:protiendas/src/core/utils/constant/navigation.dart';
import 'package:protiendas/src/core/utils/constant/spacing.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/shared/widget/app_global.dart';

part 'package:protiendas/src/features/payment_method/add/_sections/body.dart';
part 'package:protiendas/src/features/payment_method/add/_sections/form_data_tarjet.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocPaymentAdd(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarGlobal(
          onTapIcon: () {
            Modular.to.pop();
          },
          haveSearch: false,
          havCart: false,
          title: ProTiendasUiValues.paymentMethod,
        ),
        body: const Body(),
      ),
    );
  }
}
