import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class TutorialScreenInside extends StatefulWidget {
  final String title, description;
  final int id;

  const TutorialScreenInside(
      {super.key,
      required this.title,
      required this.id,
      required this.description});

  @override
  State<TutorialScreenInside> createState() => _TutorialScreenInsideState();
}

List videourl = [
  'Xn7KWR9EOGQ',
  'Zt6bVL39b9M',
  'cpI_kv9HFCg',
  'YMx8Bbev6T4',
  '7UX4r5KRHBY'
];

class _TutorialScreenInsideState extends State<TutorialScreenInside> {
  // final index = widget.id;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final index = videourl[widget.id];

    YoutubePlayerController controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(index).toString(),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    log(widget.id.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 31, 132, 122),
        title: const Text('Tradom.io',
            style: TextStyle(fontFamily: 'bauhaus', fontSize: 25)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.maxFinite,
              // height: 200,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 31, 132, 122),
                  borderRadius: BorderRadius.circular(5)),
              child: YoutubePlayerBuilder(
                onExitFullScreen: () {
                  SystemChrome.setPreferredOrientations(
                      DeviceOrientation.values);
                },
                player: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                ),
                builder: (p0, p1) {
                  return Container(
                    // height: 150,
                    child: YoutubePlayer(
                      controller: controller,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              widget.description,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
