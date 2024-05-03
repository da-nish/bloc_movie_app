import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_assets.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_dimens.dart';
import 'package:wework_app/app/network/dio_service.dart';
import 'package:wework_app/app/screen/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final dio = DioService();
  double progress = 0;
  BuildContext? _context;

  @override
  void initState() {
    progress = 0;
    startAnimation();

    super.initState();
  }

  void startAnimation() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (progress >= 1) {
        timer.cancel();
        navigate();
      }
      progress = progress + 0.02;
      setState(() {});
    });
  }

  void navigate() {
    if (_context == null) return;
    Navigator.of(_context!).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  padding: const EdgeInsets.all(Dimens.grid16),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.grid100),
                      border: Border.all(width: 1, color: AppColors.gray03)),
                  child: Image.asset(
                    AppAssets.weworkLogo,
                    height: Dimens.grid100,
                    width: Dimens.grid100,
                    // fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  width: 110,
                  height: 110,
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: CircularProgressIndicator(
                      value: progress,
                      color: AppColors.black0,
                      strokeWidth: 3,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      // );  ,
    );
  }
}
