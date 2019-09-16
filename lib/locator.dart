import 'package:get_it/get_it.dart';
import './Core/ViewModels/teamViewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  print("inside setupLocator");
 //locator.registerFactory<Api>(() => new Api('teams'));
  locator.registerLazySingleton<TeamViewModel>(() => new TeamViewModel()) ;
}