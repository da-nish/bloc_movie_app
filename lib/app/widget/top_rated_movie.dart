import 'package:flutter/material.dart';
import 'package:wework_app/app/core/theme/app_assets.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';
import 'package:wework_app/app/network/dto/top_rated_model.dart';

class TopRatedMovies extends StatelessWidget {
  final TopRatedResult item;
  const TopRatedMovies({required this.item, super.key});
  static const double borderRadius = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: 200,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(6),
      // width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius / 2),
                  child: Image.network(
                    AppAssets.cloudBasePath + (item.posterPath ?? ""),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(left: 10, bottom: 4),
                decoration: const BoxDecoration(
                    color: Colors.grey, shape: BoxShape.circle),
                child: Column(
                  children: const [
                    Icon(Icons.visibility_outlined),
                    Text("28k"),
                  ],
                ),
              )
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  item.originalTitle ?? "",
                  style: AppTextStyle.h2Medium(color: AppColors.black0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.calendar_month),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  item.overview ?? "",
                  maxLines: 2,
                  style: const TextStyle(fontSize: 14, color: AppColors.gray03),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "${item.voteCount ?? ""} Votes | ${item.voteAverage}",
                style: AppTextStyle.h3Medium(color: AppColors.gray03),
              ),
              const SizedBox(width: 6),
              Image.asset(
                AppAssets.star,
                height: 24,
                width: 24,
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
