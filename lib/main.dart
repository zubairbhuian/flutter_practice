import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            'https://scontent.fdac3-1.fna.fbcdn.net/v/t1.6435-1/123042841_945908579151890_6246602248743437967_n.jpg?stp=dst-jpg_p240x240&_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeE_H0d-mH39OysN5a0qVKJzONjtsS8E12I42O2xLwTXYuSdhNRxWIyj59WjUrCCHZGS3F2ibpUTzwGM7PXONha2&_nc_ohc=LpRttGcJpToAX8_8IIn&_nc_ht=scontent.fdac3-1.fna&oh=00_AT9hS2GcgRzLdnCwc4_jYr2oRYLT2bhHTB95Bo-hiw1-Qw&oe=627E0B61',
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        )
      ],
    ));
  }
}
