part of 'now_playing_cubit.dart';

@immutable
abstract class NowPlayingState {}

class NowPlayingInitial extends NowPlayingState {}

class NowPlayingLoading extends NowPlayingState {}

class NowPlayingViewMoreLoading extends NowPlayingState {}

class NowPlayingLoaded extends NowPlayingState {
  final NowPlayingModel nowPlayingData;
  final List<NowPlayingResult> nowPlayingDisplayList;

  NowPlayingLoaded(this.nowPlayingData, this.nowPlayingDisplayList);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NowPlayingLoaded && o.nowPlayingData == nowPlayingData;
  }

  @override
  int get hashCode => nowPlayingData.hashCode;
}

class NowPlayingError extends NowPlayingState {
  final String message;
  NowPlayingError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is NowPlayingError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
