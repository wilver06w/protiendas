part of 'package:yugioh/app/screen/init/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    Future.delayed(const Duration(seconds: 5), () {
      YuGiOhRoute.navHome();
    });
  }
}
