part of 'package:protiendas/src/features/init/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    Future.delayed(const Duration(seconds: 2), () {
      ProTiendasRoute.navDashboard();
      // ProTiendasRoute.navHome();
    });
  } else if (state is bloc.UnLoggedState) {
    ProTiendasRoute.navLogin();
  }
}
