import 'package:bloc/bloc.dart';
import 'package:wework_app/app/core/local_db/database_service.dart';
// import 'package:meta/meta.dart';
import 'package:wework_app/app/network/repository/movie_repository.dart';
import 'package:wework_app/app/network/dto/top_rated_model.dart';

part 'top_rated_state.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  final MovieRepository _repository;
  TopRatedCubit(this._repository) : super(TopRatedInitial());
  TopRatedModel? _topRatedData;

  Future<void> getTopRated() async {
    try {
      emit(TopRatedLoading());
      final topRated = await _repository.topRatedMovies();
      _topRatedData = topRated;
      AppDatabaseService.getInstance().storeTopRatingData(
          (topRated.results ?? []).map((e) => e.toTableModel()).toList());
      emit(TopRatedLoaded(topRated, topRated.results ?? []));
    } catch (e) {
      emit(TopRatedError('Error fetching data. Please try again.'));
      print(e);
    }
  }

  int page = 1;
  Future<void> viewMore() async {
    try {
      // emit(NowPlayingViewMoreLoading());
      final topRated = await _repository.topRatedMovies(page: ++page);
      _topRatedData?.results?.addAll(topRated.results ?? []);
      // _nowPlayingData = nowPlaying;
      emit(TopRatedLoaded(topRated, _topRatedData?.results ?? []));
    } catch (e) {
      emit(TopRatedError('Error fetching data. Please try again.'));
      print(e);
    }
  }

  void onSearch(String value) {
    emit(TopRatedLoading());
    if (value.isEmpty) {
      if (_topRatedData != null) {
        emit(TopRatedLoaded(_topRatedData!, _topRatedData?.results ?? []));
      }
      return;
    }
    value = value.toLowerCase();

    List<TopRatedResult> result = _topRatedData?.results?.where((element) {
          return (element.originalTitle ?? "").toLowerCase().startsWith(value);
        }).toList() ??
        [];
    emit(TopRatedLoaded(_topRatedData!, result));
  }
}
