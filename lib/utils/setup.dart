import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:news_app/data_layer/home_data_layer.dart';

Future<void> setup() async{
  await GetStorage.init();

  GetIt.I.registerSingleton<HomeData>(HomeData());

}

final getIt = GetIt.I.get<HomeData>();