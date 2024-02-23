import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/data_layer/home_data_layer.dart';

// This is the function that is called in the main to setup both GetIt and GetStorage
Future<void> setup() async {
  await GetStorage.init();

  GetIt.I.registerSingleton<HomeData>(HomeData());
}

final getIt = GetIt.I.get<HomeData>();
