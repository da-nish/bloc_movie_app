import 'package:wework_app/app/core/local_db/database.dart';
import 'package:wework_app/app/core/local_db/table/now_playing_table.dart';
import 'package:wework_app/app/core/local_db/table/top_rated_table.dart';

class AppDatabaseService {
  static final AppDatabaseService _instance = AppDatabaseService._internal();
  AppDatabase appDatabase = AppDatabase.instance;

  factory AppDatabaseService.getInstance() {
    return _instance;
  }

  AppDatabaseService._internal();

  Future<List<TopRatedTableModel>> readTopRatingData() async {
    return await appDatabase.readAllTopRated();
  }

  Future<void> storeTopRatingData(List<TopRatedTableModel> data) async {
    await appDatabase.deleteAll(TopRatedTableFields.tableName);
    await appDatabase.insertTopRated(data);
  }

  Future<void> storeNowPlayingData(List<NowPlayingTableModel> data) async {
    await appDatabase.deleteAll(NowPlayingTableFields.tableName);
    // await appDatabase.insertTopRated(data);
  }
}



// TextButton(
//                   child: const Text('read'),
//                   onPressed: () {
//                     appDatabase.readAllTopRated().then((value) {
//                       for (TopRatedTableModel e in value) {
//                         print(e.title);
//                       }
//                     });
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('delete'),
//                   onPressed: () {
//                     appDatabase.deleteAll(TopRatedTableFields.tableName);
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('create top'),
//                   onPressed: () {
//                     final model = TopRatedTableModel(
//                       title: "Hello 2",
//                       number: 1,
//                       content: "sfs dfs df",
//                       image: "img",
//                       rating: "rr",
//                       voteCount: 2,
//                       isFavorite: true,
//                       createdTime: DateTime.now(),
//                     );
//                     appDatabase.insertTopRated([model]);
//                   },
//                 ),
//                 TextButton(
//                   child: const Text('navigate'),
//                   onPressed: () {
//                     navigate();
//                   },
//                 ),