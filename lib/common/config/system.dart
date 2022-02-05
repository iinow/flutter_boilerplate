import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

configureSystemUi() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: CupertinoColors.white),
  );
}
