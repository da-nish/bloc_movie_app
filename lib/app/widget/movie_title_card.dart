import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';

import 'package:wework_app/app/network/dto/now_playing_model.dart';

class MovieTitleCard extends StatelessWidget {
  final NowPlayingResult item;
  const MovieTitleCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 3),
        child: Container(
          height: 200,
          width: 280,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: AppColors.black1.withOpacity(.6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: Row(
                  children: const [
                    SizedBox(width: 120),
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.gray02,
                      size: 20,
                    ),
                    Expanded(
                      child: Text(
                        "English",
                        style: TextStyle(fontSize: 16, color: AppColors.gray02),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.originalTitle ?? "",
                maxLines: 1,
                style: const TextStyle(fontSize: 18, color: AppColors.white),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.calendar_month, color: AppColors.gray02),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      item.overview ?? "",
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.gray02),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "${item.voteCount} Votes",
                style: const TextStyle(fontSize: 20, color: AppColors.white),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
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
            Offset(size.width, size.height - bottomHeight - 4),
            Offset(size.width - radius - 10, bottomHeight + 20),
          ),
          0 * pi,
          0.5 * pi,
          false)
      ..lineTo(size.width - bottomRightCorder + 20, size.height - bottomHeight)
      ..arcToPoint(
        Offset(size.width - 50, size.height - 50),
        radius: Radius.circular(radius - 0),
        clockwise: false,
      )
      ..lineTo(size.width - 50, size.height - 24)
      ..arcToPoint(
        Offset(size.width - radius - 40, size.height),
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
