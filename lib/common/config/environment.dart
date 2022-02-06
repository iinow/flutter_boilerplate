import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_example/common/constants.dart';

String getProfile() {
  return const String.fromEnvironment(Constants.profile,
      defaultValue: Profile.defaultProfile);
}

bool isMock() {
  return getProfile() == Profile.mock;
}

bool isLocal() {
  return getProfile() == Profile.local;
}

bool isDev() {
  return getProfile() == Profile.dev;
}

bool isProd() {
  return getProfile() == Profile.prod;
}

abstract class Profile {
  static const mock = 'mock';
  static const local = 'local';
  static const dev = 'dev';
  static const prod = 'prod';

  static const defaultProfile = local;
}

configureDotEnv() async {
  await dotenv.load(fileName: 'assets/env/.env.${getProfile()}');
}
