import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_assets.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/network/dto/now_playing_model.dart';
import 'package:wework_app/app/widget/movie_title_card.dart';

class MovieCard extends StatelessWidget {
  final NowPlayingResult item;
  const MovieCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 280;
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                    height: 400,
                    width: cardWidth,
                    color: AppColors.cardBackgroundColor,
                    child: Image.network(
                      AppAssets.cloudBasePath + (item.backdropPath ?? ""),
                      fit: BoxFit.cover,
                    ))),
            Positioned(bottom: 0, child: MovieTitleCard(item: item)),
            Positioned(
                right: 0,
                child: SizedBox(
                  width: cardWidth,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 10),
                    child: Row(
                      children: [
                        const SizedBox(width: 12),
                        Text(item.voteAverage.toString()),
                        const SizedBox(width: 6),
                        Image.asset(
                          AppAssets.star,
                          height: 16,
                          width: 16,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.black0.withOpacity(.2),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.visibility_outlined,
                                color: AppColors.gray01,
                              ),
                              Text(
                                "34",
                                style: TextStyle(color: AppColors.gray01),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        // BackdropFilter(
                        //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        //   child:
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: AppColors.black0.withOpacity(.2),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.favorite_border,
                              color: AppColors.gray01),
                        ),
                        // ),
                      ],
                    ),
                  ),
                ))
          ],
        ));
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
          Rect.fromCircle(
              center: Offset(size.width - radius, size.height - radius - 62),
              radius: radius),
          0,
          0.5 * pi,
          false)
      ..lineTo(size.width - bottomRightCorder + 20, size.height - bottomHeight)
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
