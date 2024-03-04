part of 'package:protiendas/app/screen/init/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    Future.delayed(const Duration(seconds: 2), () {
      YuGiOhRoute.navDashboard();
    });
  } else if (state is bloc.UnLoggedState) {
    Future.delayed(const Duration(seconds: 5), () {
      YuGiOhRoute.navLogin();
    });
  }
}
