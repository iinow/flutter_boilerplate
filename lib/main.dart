import 'dart:developer' as dev;
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_example/common/constants.dart';
import 'package:flutter_example/common/config/index.dart' as config;
import 'package:flutter_example/route/router.dart' as router;
import 'package:get/get.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kakao_flutter_sdk/common.dart';

import 'common/config/environment.dart';

void main() async {
  config.process();
  runApp(const MyApp());
  dev.log('start', time: DateTime.now());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(
      title: Constants.title,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: isLocal(),
      initialRoute: router.defaultRoutePath,
      routes: router.getRouteMap(),
      theme: CupertinoTheme.of(context),
    );
  }
}
