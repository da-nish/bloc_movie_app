import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:wework_app/app/core/theme/theme.dart';

import 'dart:async';

class BaseWidget extends StatefulWidget {
  final Widget? child;
  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  bool isConnected = true;
  StreamSubscription<ConnectivityResult>? subscription;

  Widget strip(Color background, Color textColor, String text,
      {bool isMarque = false}) {
    return SizedBox(
      height: 24,
      width: double.infinity,
      child: Container(
          height: Dimens.grid24,
          width: double.infinity,
          color: background,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h4Regular(color: textColor),
                ),
              ),
            ],
          )),
    );
  }

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        setState(() {
          isConnected = true;
        });
      } else if (result == ConnectivityResult.wifi) {
        setState(() {
          isConnected = true;
        });
      } else {
        setState(() {
          isConnected = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        child: SafeArea(
          bottom: false,
          child: Column(children: [
            if (!isConnected) strip(Colors.red, AppColors.white, "No Internet"),
            Expanded(child: widget.child!)
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
    // service?.dispose();
  }
}
