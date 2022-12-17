import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

var temp;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  if (Platform.isAndroid) {
    AndroidDeviceInfo info = await deviceInfo.androidInfo;
    print(info.toMap());
  } else if (Platform.isIOS) {
    IosDeviceInfo info = await deviceInfo.iosInfo;
    print(info.toMap());
  } else if (Platform.isLinux) {
    LinuxDeviceInfo info = await deviceInfo.linuxInfo;
    print(info.toMap());
  } else if (Platform.isMacOS) {
    MacOsDeviceInfo info = await deviceInfo.macOsInfo;
    print(info.toMap());
  } else if (Platform.isWindows) {
    WindowsDeviceInfo info = await deviceInfo.windowsInfo;
    print(info.toMap());
  }

  final info = await deviceInfo.deviceInfo;
  print(info.toMap());

  temp = info;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info Plus'),
      ),
      body: Center(
          child: Column(
        children: [
          const Text(
            'Build Details:',
          ),
          Text(
            'product: ${temp.product}',
          ),
          Text(
            'display: ${temp.display}',
          ),
          Text(
            'hardware: ${temp.hardware}',
          ),
          Text(
            'model: ${temp.model}',
          ),
        ],
      )),
    );
  }
}
