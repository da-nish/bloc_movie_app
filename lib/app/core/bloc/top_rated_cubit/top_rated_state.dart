part of 'top_rated_cubit.dart';

// @immutable
abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoading extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final TopRatedModel topRatedData;
  final List<TopRatedResult> topRatedDisplayList;

  TopRatedLoaded(this.topRatedData, this.topRatedDisplayList);

  // @override
  // bool operator ==(Object o) {
  //   if (identical(this, o)) return true;

  //   return o is TopRatedLoaded && o.topRatedDisplayList == topRatedDisplayList;
  // }

  // @override
  // int get hashCode => topRatedDisplayList.hashCode;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TopRatedLoaded && o.topRatedData == topRatedData;
  }

  @override
  int get hashCode => topRatedData.hashCode;
}

class TopRatedError extends TopRatedState {
  final String message;
  TopRatedError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TopRatedError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
