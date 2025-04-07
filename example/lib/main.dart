import 'package:flutter/material.dart';
import 'package:transparent_toast_mirror/transparent_toast_mirror.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transparent Toast Mirror Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
        title: const Text('Transparent Toast Mirror Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                TransparentToastMirror.show(
                  context,
                  'Simple Toast Message',
                );
              },
              child: const Text('Show Simple Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                TransparentToastMirror.show(
                  context,
                  'Center Position Toast',
                  position: GlassToastPosition.center,
                  duration: const Duration(seconds: 3),
                );
              },
              child: const Text('Show Center Toast'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                TransparentToastMirror.show(
                  context,
                  'Custom Styled Toast',
                  position: GlassToastPosition.top,
                  backgroundColor: Colors.blue,
                  backgroundOpacity: 0.7,
                );
              },
              child: const Text('Show Custom Toast'),
            ),
          ],
        ),
      ),
    );
  }
}
