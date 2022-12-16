import 'package:flutter/material.dart';
import 'package:rpi_gpio/rpi_gpio.dart';

import 'exampleApp.dart';

/// Launch the example by injecting an instance of [RpiGpio].
/// This only works on the Raspberry Pi.
///
/// The [exampleApp] resides in a separate library
/// so that it does not reference the [RpiGpio] native libary
/// and thus can be tested with a mock [Gpio] on any platform.
main() async {
  final gpio = await initialize_RpiGpio();
  await runExample(gpio);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
