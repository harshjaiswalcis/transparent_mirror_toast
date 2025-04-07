import 'package:flutter/material.dart';
import 'package:transparent_mirror_toast/transparent_mirror_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transparent Mirror Toast Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transparent Mirror Toast Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                TransparentMirrorToast.show(
                  context,
                  'This is a bottom toast!',
                  position: ToastPosition.bottom,
                );
              },
              child: const Text('Show Bottom Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                TransparentMirrorToast.show(
                  context,
                  'This is a center toast!',
                  position: ToastPosition.center,
                );
              },
              child: const Text('Show Center Toast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                TransparentMirrorToast.show(
                  context,
                  'This is a top toast!',
                  position: ToastPosition.top,
                );
              },
              child: const Text('Show Top Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
