import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:protiendas/app/utils/colors.dart';
import 'package:protiendas/app/utils/navigation.dart';
import 'package:protiendas/app/utils/spacing.dart';
import 'package:protiendas/app/utils/text/text.dart';
import 'package:protiendas/app/utils/yugioh_ui.dart';
import 'package:protiendas/app/widget/app_global.dart';

part 'package:protiendas/app/screen/payment_method/home/_sections/bottom.dart';
part 'package:protiendas/app/screen/payment_method/home/_sections/item_payment.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const Bottom(),
      appBar: AppBarGlobal(
        onTapIcon: () {
          Modular.to.pop();
        },
        haveSearch: false,
        havCart: false,
        title: ProTiendasUiValues.paymentMethod,
      ),
      body: ListView(
        padding: const EdgeInsets.all(YuGiOhSpacing.lg),
        children: [
          XigoTextHeading6(
            ProTiendasUiValues.howWantPay,
            weight: FontWeight.w500,
          ),
          const Gap(YuGiOhSpacing.xxl),
          Padding(
            padding: const EdgeInsets.all(YuGiOhSpacing.md),
            child: Column(
              children: [
                ItemPaymentMethod(
                  onTap: () {
                    YuGiOhRoute.navAddPayment();
                  },
                  title: ProTiendasUiValues.newDebitCard,
                  icon: ProTiendasUiValues.icTarjet,
                ),
                const Gap(YuGiOhSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.newDebitCard,
                  icon: ProTiendasUiValues.icTarjet,
                ),
                const Gap(YuGiOhSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.bankTransferWithPse,
                  icon: ProTiendasUiValues.icBank,
                ),
                const Gap(YuGiOhSpacing.sl),
                ItemPaymentMethod(
                  onTap: () {},
                  title: ProTiendasUiValues.efecty,
                  icon: ProTiendasUiValues.icEfecty,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
