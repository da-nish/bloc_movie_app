import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wework_app/app/core/local_db/database_service.dart';
import 'package:wework_app/app/core/local_db/table/top_rated_table.dart';
import 'package:wework_app/app/network/repository/movie_repository.dart';
import 'package:wework_app/app/network/dto/now_playing_model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  final MovieRepository _repository;
  NowPlayingCubit(this._repository) : super(NowPlayingInitial());

  NowPlayingModel? _nowPlayingData;
  Future<void> getNowPlaying() async {
    try {
      emit(NowPlayingLoading());
      final nowPlaying = await _repository.nowPlayingMovies();
      _nowPlayingData = nowPlaying;
      emit(NowPlayingLoaded(nowPlaying, nowPlaying.results ?? []));
    } catch (e) {
      emit(NowPlayingError('Error fetching data. Please try again.'));
      print(e);
    }
  }

  int page = 1;
  Future<void> viewMore() async {
    try {
      // emit(NowPlayingViewMoreLoading());
      final nowPlaying = await _repository.nowPlayingMovies(page: ++page);
      _nowPlayingData?.results?.addAll(nowPlaying.results ?? []);
      // _nowPlayingData = nowPlaying;
      emit(NowPlayingLoaded(nowPlaying, _nowPlayingData?.results ?? []));
    } catch (e) {
      emit(NowPlayingError('Error fetching data. Please try again.'));
      print(e);
    }
  }

  void onSearch(String value) {
    emit(NowPlayingLoading());
    if (value.isEmpty) {
      if (_nowPlayingData != null) {
        emit(
          NowPlayingLoaded(
            _nowPlayingData!,
            _nowPlayingData?.results ?? [],
          ),
        );
      }
      return;
    }
    value = value.toLowerCase();

    List<NowPlayingResult> result = _nowPlayingData?.results?.where((element) {
          return (element.originalTitle ?? "").toLowerCase().startsWith(value);
        }).toList() ??
        [];
    emit(NowPlayingLoaded(_nowPlayingData!, result));
  }
}
