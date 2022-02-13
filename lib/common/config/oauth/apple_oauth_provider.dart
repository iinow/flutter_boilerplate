import 'package:flutter_example/common/config/oauth_provider.dart';
import 'package:flutter_example/common/enums/oauth_provider_type.dart';
import 'package:injectable/injectable.dart';

@Named('apple')
@Injectable(as: OAuthProvider)
class AppleOAuthProvider implements OAuthProvider<String> {
  @override
  OAuthProviderType get providerType => OAuthProviderType.apple;

  @override
  String get appKey => const String.fromEnvironment('apple.app_key');

  @override
  void init() {}

  @override
  Future<String> login() async {
    // TODO: implement login
    throw UnimplementedError();
  }
}
