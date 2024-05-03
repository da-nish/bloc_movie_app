import 'package:flutter/material.dart';
import 'package:wework_app/app/core/bloc/now_playing_cubit/now_playing_cubit.dart';
import 'package:wework_app/app/core/bloc/top_rated_cubit/top_rated_cubit.dart';
import 'package:wework_app/app/network/repository/movie_repository.dart';
import 'package:wework_app/app/network/dio_service.dart';
import 'package:wework_app/app/screen/splash_screen/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wework_app/app/widget/base_widget/base_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DioService dioService = DioService();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NowPlayingCubit(MovieRepository(dioService.dioClient!)),
        ),
        BlocProvider(
          create: (context) =>
              TopRatedCubit(MovieRepository(dioService.dioClient!)),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
          ),
          builder: (context, child) {
            return BaseWidget(child: child ?? const SplashScreen());
            // return BaseWidget();
          },
          debugShowCheckedModeBanner: false,
          home: const SplashScreen()),
    );
  }
}
