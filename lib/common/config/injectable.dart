import 'package:flutter_example/common/config/environment.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies(GetIt getIt) =>
    $initGetIt(getIt, environment: getProfile());
