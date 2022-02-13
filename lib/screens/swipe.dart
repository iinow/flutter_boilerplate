import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_example/common/config/config.dart';
import 'package:flutter_example/common/config/oauth/kakao_oauth_provider.dart';
import 'package:flutter_example/common/config/oauth_provider.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/all.dart';

class Swipe extends StatelessWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // print('onHorizontalDragUpdate, ${details.delta.dx}');
        },
        onHorizontalDragEnd: (details) {
          // swipe right
          if (details.primaryVelocity! > 0) {
            // getIt
            // Get.toNamed(page)
          }

          // swipe right
          if (details.primaryVelocity! < 0) {
            // getIt
          }
          print('onHorizontalDragEnd, ${details.primaryVelocity}');
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: CupertinoColors.destructiveRed,
          child: CupertinoButton(
            onPressed: () {
              var kakaoProvider =
                  GetIt.I.get<OAuthProvider>(instanceName: 'kakao');
              kakaoProvider.login();
            },
            child: const Center(
              child: Text('hell'),
            ),
          ),
        ),
      ),
    );
  }
}
