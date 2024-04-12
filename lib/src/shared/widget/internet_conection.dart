import 'package:flutter/material.dart';
import 'dart:async';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:protiendas/src/core/utils/constant/colors.dart';
import 'package:protiendas/src/core/utils/constant/protienda_ui.dart';
import 'package:protiendas/src/core/utils/helpers/text/text.dart';

class InternetConnectionWidget extends StatefulWidget {
  final Widget child;

  const InternetConnectionWidget({super.key, required this.child});

  @override
  State<InternetConnectionWidget> createState() =>
      _InternetConnectionWidgetState();
}

class _InternetConnectionWidgetState extends State<InternetConnectionWidget> {
  bool isDeviceConnected = true;
  StreamController<bool> streamController = StreamController<bool>();

  @override
  void initState() {
    streamController.add(isDeviceConnected);
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      InternetConnectionChecker()
          .hasConnection
          .then((value) => streamController.add(value));
    });
    InternetConnectionChecker()
        .hasConnection
        .then((value) => streamController.add(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        StreamBuilder<bool>(
          stream: streamController.stream,
          builder: (context, snapshot) {
            return Visibility(
              visible: !isDeviceConnected,
              child: SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  color:ProTiendasUiColors.aeroBlue,
                  height: !isDeviceConnected ? 16.0 : 0.0,
                  child: XigoTextMedium(
                 ProTiendasUiValues.noConection,
                  ),
                ),
              ),
            );
          }
        ),
      ],
    );
  }
}
