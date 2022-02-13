import 'package:flutter_example/common/config/oauth_provider.dart';

import 'config.dart';
import 'environment.dart';
import 'injectable.dart';
import 'system.dart';

process() async {
  var getIt = configureGet();
  configureDependencies(getIt);
  await configureDotEnv();
  configureSystemUi();
  configureOAuth(getIt);
}
