import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

class ConnectivityManager extends StatefulWidget {
  final Widget child;

  const ConnectivityManager({super.key, required this.child});

  @override
  _ConnectivityManagerState createState() => _ConnectivityManagerState();
}

class _ConnectivityManagerState extends State<ConnectivityManager> {
  late bool _isConnected;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _isConnected = true;
    _checkInternet();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) => _checkInternet());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _checkInternet() async {
    bool isConnected;
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected = false;
    }

    if (isConnected != _isConnected) {
      setState(() {
        _isConnected = isConnected;
      });
      showConnectivitySnackBar(isConnected);
    }
  }

  void showConnectivitySnackBar(bool isConnected) {
    String message;
    Color backgroundColor;

    if (isConnected) {
      message = "Network connected";
      backgroundColor = Colors.green;
    } else {
      message = "No internet connection";
      backgroundColor = Colors.red;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
