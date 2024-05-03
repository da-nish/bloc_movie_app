import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:wework_app/app/core/bloc/now_playing_cubit/now_playing_cubit.dart';
import 'package:wework_app/app/core/bloc/top_rated_cubit/top_rated_cubit.dart';
import 'package:wework_app/app/core/local_db/database_service.dart';
import 'package:wework_app/app/core/local_db/table/top_rated_table.dart';
import 'package:wework_app/app/core/theme/app_assets.dart';
import 'package:wework_app/app/core/theme/app_colors.dart';
import 'package:wework_app/app/core/theme/app_dimens.dart';
import 'package:wework_app/app/core/theme/app_text_style.dart';
import 'package:wework_app/app/widget/heading_text/heading_text.dart';
import 'package:wework_app/app/widget/movie_card.dart';
import 'package:wework_app/app/widget/no_data/no_data.dart';
import 'package:wework_app/app/widget/note_card.dart';
import 'package:wework_app/app/widget/search_field/search_field.dart';
import 'package:wework_app/app/network/dio_service.dart';
import 'package:wework_app/app/network/dto/now_playing_model.dart';
import 'package:wework_app/app/network/dto/top_rated_model.dart';
import 'package:wework_app/app/widget/top_rated_movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = DioService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundGradient),
          ),
          child: Container(
            margin: const EdgeInsets.all(Dimens.grid20),
            child: RefreshIndicator(
              color: AppColors.black0,
              onRefresh: () {
                context.read<NowPlayingCubit>().getNowPlaying();
                context.read<TopRatedCubit>().getTopRated();
                return Future(() => null);
              },
              child: ListView(
                children: [
                  const SizedBox(height: Dimens.grid12),
                  _header(),
                  const SizedBox(height: Dimens.grid20),
                  SearchField(
                    onSearch: (p0) {
                      context.read<NowPlayingCubit>().onSearch(p0);
                      context.read<TopRatedCubit>().onSearch(p0);
                    },
                  ),
                  const SizedBox(height: Dimens.grid20),
                  const NoteCard(),
                  const SizedBox(height: Dimens.grid20),
                  const HeadingText(text: "Now Playing"),
                  const SizedBox(height: Dimens.grid12),
                  _nowPlaying(),
                  const SizedBox(height: Dimens.grid20),
                  const HeadingText(text: "TOP RATED"),
                  const SizedBox(height: Dimens.grid12),
                  _topRated(),
                  const SizedBox(height: Dimens.grid10),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _bottomAppBar()
        // );  ,
        );
  }

  Widget _topRated() => BlocBuilder<TopRatedCubit, TopRatedState>(
        builder: (context, state) {
          if (state is TopRatedInitial) {
            context.read<TopRatedCubit>().getTopRated();
            return const Text('No Items');
          } else if (state is TopRatedLoading) {
            return const CircularProgressIndicator();
          } else if (state is TopRatedLoaded) {
            if (state.topRatedDisplayList.isEmpty) {
              return const NoDataFound();
            }
            return SizedBox(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.topRatedDisplayList.length,
                  itemBuilder: (context, index) {
                    TopRatedResult item = state.topRatedDisplayList[index];
                    bool isLast = index + 1 == state.topRatedDisplayList.length;
                    if (isLast) {
                      return Column(
                        children: [
                          SizedBox(
                              width: double.infinity,
                              child: TopRatedMovies(item: item)),
                          const SizedBox(height: 20),
                          InkWell(
                              onTap: () {
                                context.read<TopRatedCubit>().viewMore();
                              },
                              child: const Text("View more"))
                        ],
                      );
                    }
                    return TopRatedMovies(item: item);
                  }),
            );
          } else if (state is TopRatedError) {
            return Text(state.message);
          } else {
            return const Text('Hmm...Something is not right.');
          }
        },
      );

  Widget _nowPlaying() => BlocBuilder<NowPlayingCubit, NowPlayingState>(
        builder: (context, state) {
          if (state is NowPlayingInitial) {
            context.read<NowPlayingCubit>().getNowPlaying();
            return const Text('No Items');
          } else if (state is NowPlayingLoading) {
            return const CircularProgressIndicator();
          } else if (state is NowPlayingLoaded) {
            if (state.nowPlayingDisplayList.isEmpty) {
              return const NoDataFound();
            }
            return SizedBox(
              height: 400,
              // width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.nowPlayingDisplayList.length,
                  itemBuilder: (context, index) {
                    NowPlayingResult item = state.nowPlayingDisplayList[index];
                    bool isLast =
                        index + 1 == state.nowPlayingDisplayList.length;
                    if (isLast) {
                      return Row(
                        children: [
                          MovieCard(item: item),
                          const SizedBox(width: 20),
                          InkWell(
                              onTap: () {
                                context.read<NowPlayingCubit>().viewMore();
                              },
                              child: const Text("View more"))
                        ],
                      );
                    }
                    // return Text("data");
                    return MovieCard(item: item);
                  }),
            );
          } else if (state is NowPlayingError) {
            return Text(state.message);
          } else {
            return const Text('Hmm...Something is not right.');
          }
        },
      );

  Widget _header() => Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(
                      "Redstone Oaks",
                      style: AppTextStyle.h4Medium(),
                    )
                  ],
                ),
                const Text(
                  "Vishnu Dev Nagar, Wakad Pimpri-Chinchwad asdfadsfas",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: Dimens.grid10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.grid100)),
            child: Image.asset(
              AppAssets.weLogoWhite,
              width: Dimens.grid40,
              height: Dimens.grid40,
            ),
          )
        ],
      );

  Widget _bottomAppBar() => BottomNavigationBar(
        currentIndex: 0,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        elevation: 0,
        fixedColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              AppAssets.weLogoBlack,
              height: 24,
              width: 24,
            ),
            label: 'Upcoming',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.map_outlined,
              color: Colors.grey,
            ),
            label: 'Explore',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.grey,
            ),
            label: 'Upcoming',
          ),
        ],
      );
}
