import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter_example/common/config/config.dart';
import 'package:flutter_example/service/i_room_service.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('dkfjdkf'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Text('Done'),
          onPressed: () => Navigator.pop(context),
        ),
        brightness: Brightness.light,
        backgroundColor: CupertinoColors.white,
        border: Border.all(color: CupertinoColors.white),
      ),
      backgroundColor: CupertinoColors.white,
      child: Center(
        child: Column(
          children: [
            Text(AppLocalizations.of(context)!.helloWorld),
            CupertinoButton(
              child: const Text('클릭'),
              onPressed: () {
                var roomService = getIt<IRoomService>();
                var rooms = roomService.findRooms();
                dev.log('rooms: ${jsonEncode(rooms)}');
              },
            ),
            CupertinoButton(
              child: const Text('지도 바로가기'),
              onPressed: () {
                Get.toNamed('/maps');
              },
            ),
            CupertinoButton(
              child: const Text('제스쳐'),
              onPressed: () {
                Get.toNamed('/swipe');
              },
            ),
            CupertinoButton(
              child: const Text('provider 예제'),
              onPressed: () {
                Get.toNamed('/provider');
              },
            ),
          ],
        ),
      ),
    );
  }
}
