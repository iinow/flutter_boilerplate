import 'config.dart';
import 'environment.dart';
import 'injectable.dart';
import 'system.dart';

process() {
  var getIt = configureGet();
  configureDependencies(getIt);
  configureDotEnv();
  configureSystemUi();
}
