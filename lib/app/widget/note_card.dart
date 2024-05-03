import 'dart:math';

import 'package:flutter/material.dart';

import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.all(20).copyWith(left: 0),
            child: Text("24th Apr 2024", style: AppTextStyle.h5Medium()),
          ),
        ),
        ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              AppColors.black1.withOpacity(.1),
              AppColors.black1.withOpacity(.1),
              AppColors.black1.withOpacity(.15),
              AppColors.black1.withOpacity(.3),
            ])),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 66),
                Text(
                  "We Movies",
                  maxLines: 1,
                  style: AppTextStyle.h4Medium(color: AppColors.black0),
                ),
                // const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Movies are loaded in now playing",
                        maxLines: 2,
                        style: AppTextStyle.h6Regular(color: AppColors.black0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 32;
    double bottomHeight = 60;
    double bottomRightCorder = 60;

    Path path = Path()
      ..lineTo(size.width - radius, 0)
      ..arcTo(
          Rect.fromPoints(
              Offset(size.width - radius, 0), Offset(size.width, radius)),
          1.5 * pi,
          0.5 * pi,
          true)
      ..arcTo(
          Rect.fromPoints(
            Offset(size.width, 50),
            Offset(size.width - radius + 0, 10),
          ),
          0 * pi,
          0.5 * pi,
          false)
      ..lineTo(
          size.width - bottomRightCorder + 40, size.height - bottomHeight - 10)
      ..arcToPoint(
        Offset(size.width - 50, size.height - 50),
        radius: Radius.circular(radius - 0),
        clockwise: false,
      )
      ..lineTo(size.width - 50, size.height - 20)
      ..arcToPoint(
        Offset(size.width - radius - 36, size.height),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..lineTo(radius, size.height)
      ..arcTo(Rect.fromLTRB(0, size.height - radius, radius, size.height),
          0.5 * pi, 0.5 * pi, false)
      ..arcTo(const Rect.fromLTWH(0, 60, 40, 40), 1 * pi, 0.5 * pi, false)
      ..lineTo(90, 60)
      ..arcToPoint(
        const Offset(100 + 20, 30),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..arcToPoint(
        const Offset(100 + 50, 0),
        radius: Radius.circular(radius),
        clockwise: true,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
