import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_example/common/constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

import 'common/utils/websocket.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';

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
  log(profile);
  await dotenv.load(fileName: 'assets/env/.env.$profile');
  log(dotenv.get('FOO'));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationsDelegates = [
      // GlobalMaterialLocalizations.delegate,
      // GlobalWidgetsLocalizations.delegate,
      // GlobalCupertinoLocalizations.delegate,
    ];

    var supportedLocales = [
      const Locale('ko', 'KR'),
      const Locale('en', 'EN'),
    ];

    // var deviceData = MediaQuery.of(context);
    // deviceData.size

    return MaterialApp(
      title: 'Localizations Sample App',
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.orange,
        ),
        // textTheme: GoogleFonts.emilysCanndyTextTheme()
      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // final _localRenderer = RTCVideoRenderer();
  // final re = RTCPeerConnection()

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const mediaConstraints = {
      'audio': true,
      'video': {'facingMode': 'user'},
    };

    var socket = io(
      'http://192.168.0.5:8080/maps',
      OptionBuilder().setTransports(['websocket']).build(),
    );
    socket.onConnect((_) => log('연결 성공'));
    socket.onConnectError((data) => log(data));
    socket.onError((data) => log(data));
    log('dkdkdkd');

    // final socket = SimpleWebSocket('http://192.168.0.5:8080/maps');
    // socket.connect();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '누를 수  이2',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // Text(AppLocalizations.of(context)!.helloWorld),
            // RTCVideoView(_localRenderer),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
