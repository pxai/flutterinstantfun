import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Instant Fun'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioCache cache = AudioCache();
  final AudioPlayer player = AudioPlayer();
  bool playing = false;
  List<String> sounds = [
    'Chan:sounds/red-sus.mp3',
    'Red Sus:sounds/chan-chan.mp3',
    'Dramatic:sounds/dramatic.mp3',
    'Celebrate:sounds/celebrate.mp3',
    'Freak Out:sounds/freakout.mp3',
    'WakeMe:sounds/wakemeup.mp3',
    'Pasta:sounds/italy.mp3',
    'Osasuna:sounds/osasuna.mp3',
    'Basque:sounds/basque.mp3',
  ];

  void _stopSound() {
    if (playing) {
      player.stop();
      playing = false;
    }
  }

  void _playSound([String file = 'sounds/chan-chan.mp3']) async {
    // play asset sound flutter
    if (playing) {
      player.stop();
      playing = false;
    }
    await player.play(AssetSource(file));
    setState(() {
      playing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buttons = sounds.map((item) {
      String name, path;
      [name, path] = item.split(':');

      return ElevatedButton(
        onPressed: () {
          print('$item pressed');
          _playSound(path);
        },
        child: Text(name),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        // Generate 100 widgets that display their index in the List.
        // How to generate from a Map
        children: buttons,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _stopSound,
        tooltip: 'Stop',
        child: const Icon(Icons.stop),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
