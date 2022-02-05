import 'dart:developer' as dev;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_example/common/constants.dart';
import 'package:flutter_example/route/router.dart' as router;
import 'package:get/get.dart';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
)
void configureDependencies() => $initGetIt(getIt);

void $initGetIt(GetIt getIt) {}

void main() async {
  runApp(const MyApp());
  const profile =
      String.fromEnvironment(Constants.profile, defaultValue: 'local');
  await dotenv.load(fileName: 'assets/env/.env.$profile');
  dev.log('start');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log('${AppLocalizations.of(context)?.defaultTitle}');
    return GetCupertinoApp(
      title: Constants.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: router.defaultRoutePath,
      routes: router.getRouteMap(),
    );
  }
}
