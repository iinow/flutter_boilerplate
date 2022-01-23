import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_example/common/mock/data.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final TextEditingController _nicknameController =
      TextEditingController(text: name());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: _nicknameController,
                  // obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nickname',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  log('연결 클릭');
                },
                child: const Text('연결'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
