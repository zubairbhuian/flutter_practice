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
// !Formate Time
  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    setAudio();
    // !Listen to state:playing,paused,stopped
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
// ! Listion to audio duration
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // !Listion to audio Position
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    super.initState();
  }

  //  ?SetAudio
  Future setAudio() async {
    //  !Repeat song when completed
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
    // !Load audio from assets
    final player = AudioCache(prefix: 'assets/');
    final url = await player.load('alif.mp3');
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              'https://scontent.fdac3-1.fna.fbcdn.net/v/t1.6435-1/123042841_945908579151890_6246602248743437967_n.jpg?stp=dst-jpg_p240x240&_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_eui2=AeE_H0d-mH39OysN5a0qVKJzONjtsS8E12I42O2xLwTXYuSdhNRxWIyj59WjUrCCHZGS3F2ibpUTzwGM7PXONha2&_nc_ohc=LpRttGcJpToAX8_8IIn&_nc_ht=scontent.fdac3-1.fna&oh=00_AT9hS2GcgRzLdnCwc4_jYr2oRYLT2bhHTB95Bo-hiw1-Qw&oe=627E0B61',
              width: double.infinity,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 24,
            child: Text(
              'The Flutter Song',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 24,
            child: Text(
              'Zubair Bhuian',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
          Slider(
            min: 0,
            max: duration.inSeconds.toDouble(),
            value: position.inSeconds.toDouble(),
            onChanged: (value) async {
              final position = Duration(seconds: value.toInt());
              await audioPlayer.seek(position);
              //  !Optinal: Play audio if was paused
              await audioPlayer.resume();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatTime(position)),
                Text(formatTime(duration - position)),
              ],
            ),
          ),
          CircleAvatar(
            radius: 35,
            child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () async {
                  if (isPlaying) {
                    await audioPlayer.pause();
                  } else {
                    await audioPlayer.resume();
                  }
                }),
          )
        ],
      ),
    ));
  }
}
