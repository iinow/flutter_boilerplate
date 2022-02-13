import 'dart:developer' as dev;

import 'package:flutter_example/common/enums/oauth_provider_type.dart';
import 'package:get_it/get_it.dart';

abstract class OAuthProvider<I> {
  final OAuthProviderType providerType;

  final String appKey;

  OAuthProvider(this.providerType, this.appKey);

  void init();

  Future<I> login() async {
    throw UnimplementedError();
  }
}

configureOAuth(GetIt getIt) {
  var kakaoProvider = GetIt.I.get<OAuthProvider>(instanceName: 'kakao');
  kakaoProvider.init();
}
