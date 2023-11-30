import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class SocketController extends GetxController {
  WebSocketChannel? _socketChannel;

  WebSocketChannel get socket => _socketChannel!;

  @override
  void onInit() {
    print("init");
    super.onInit();

    _socketChannel = IOWebSocketChannel.connect(
        'wss://1kfw94gov0.execute-api.eu-central-1.amazonaws.com/production');
  }

  @override
  void dispose() {
    super.dispose();

    _socketChannel!.sink.close();
  }
}
