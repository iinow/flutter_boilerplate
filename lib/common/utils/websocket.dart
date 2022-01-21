import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';

class SimpleWebSocket {
  String _url;
  var _socket;
  Function()? onOpen;
  Function(dynamic msg)? onMessage;
  Function(int code, String reaso)? onClose;

  SimpleWebSocket(this._url);

  connect() async {
    try {
      final channel = IOWebSocketChannel.connect('ws://192.168.0.5:8080/maps');

      //_socket = await WebSocket.connect(_url);
      _socket = await _connectForSelfSignedCert(_url);
      onOpen?.call();
      _socket.listen((data) {
        onMessage?.call(data);
      }, onDone: () {
        onClose?.call(_socket.closeCode, _socket.closeReason);
      });
    } catch (e) {
      onClose?.call(500, e.toString());
    }
  }

  send(data) {
    if (_socket != null) {
      _socket.add(data);
      print('send: $data');
    }
  }

  close() {
    if (_socket != null) _socket.close();
  }

  Future<WebSocket> _connectForSelfSignedCert(url) async {
    try {
      // Random r = Random();
      // String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
      HttpClient client = HttpClient();
      // var req = await client.getUrl(Uri.parse('http://192.168.0.5:8080'));
      // var res = await req.close();
      // final data = await res.transform(utf8.decoder).join();
      // print(data);
      Rx.fromCallable(() => client.getUrl(Uri.parse('http://192.168.0.5:8080')))
          .flatMap((req) => Rx.fromCallable(() => req.close()))
          .flatMap((res) =>
              Rx.fromCallable(() => res.transform(utf8.decoder).join()))
          .forEach((value) => print('res: $value'));
      // HttpClient client = HttpClient(context: SecurityContext());
      // client.badCertificateCallback =
      //     (X509Certificate cert, String host, int port) {
      //   print(
      //       'SimpleWebSocket: Allow self-signed certificate => $host:$port. ');
      //   return true;
      // };

      HttpClientRequest request =
          await client.getUrl(Uri.parse(url)); // form the correct url here
      // request.headers.add('Connection', 'Upgrade');
      // request.headers.add('Upgrade', 'websocket');
      // request.headers.add(
      //     'Sec-WebSocket-Version', '13'); // insert the correct version here
      // request.headers.add('Sec-WebSocket-Key', key.toLowerCase());

      HttpClientResponse response = await request.close();
      // ignore: close_sinks
      Socket socket = await response.detachSocket();
      var webSocket = WebSocket.fromUpgradedSocket(
        socket,
        protocol: 'http',
        serverSide: false,
      );

      return webSocket;
    } catch (e) {
      throw e;
    }
  }
}
