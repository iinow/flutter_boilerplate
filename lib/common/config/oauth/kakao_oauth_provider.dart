import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_example/common/config/oauth_provider.dart';
import 'package:flutter_example/common/enums/oauth_provider_type.dart';
import 'package:injectable/injectable.dart';
import 'package:kakao_flutter_sdk/common.dart';
import 'package:kakao_flutter_sdk/all.dart';

@Named('kakao')
@Injectable(as: OAuthProvider)
class KakaoOAuthProvider implements OAuthProvider<String> {
  @override
  OAuthProviderType get providerType => OAuthProviderType.kakao;

  @override
  String get appKey => dotenv.env['kakao.app_key'] as String;

  @override
  void init() {
    KakaoContext.clientId = appKey;
  }

  @override
  Future<String> login() async {
    try {
      var res = await UserApi.instance.loginWithKakaoTalk();
      print(jsonEncode(res));
      // perform actions after login
    } catch (e) {
      print('error on login: $e');
    }
    return '';
  }
}
