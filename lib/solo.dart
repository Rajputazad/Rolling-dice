import 'dart:math';
// ignore: depend_on_referenced_packages
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Solo extends StatefulWidget {
  const Solo({super.key});

  @override
  State<Solo> createState() => _SoloState();
}

class _SoloState extends State<Solo> with SingleTickerProviderStateMixin {
  int rightdice = 2;
  late AnimationController _controller;
  late CurvedAnimation animation;
  final audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    // audioPlayer.dispose();
    _controller.dispose();
    animation.dispose();
    super.dispose();
  }

  animate() {
    _controller = AnimationController(
        duration: const Duration(microseconds: 600400), vsync: this);
    animation = CurvedAnimation(parent: _controller, curve: Curves.bounceOut);
    // _controller.forward();
    animation.addListener(() {
      setState(() {});
      // print(_controller.value);
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          var random2 = Random();
          var right = random2.nextInt(6) + 1;
          rightdice = right;
        });
        _controller.reverse();
      }
    });
  }

  void roll() {
//  await audioPlayer.play(UrlSource('assts/sounds/sound.mp3'));
    song();
    _controller.forward();
  }

  void song() {
    audioPlayer.play(AssetSource(
      'sound/sound.mp3',
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rolling Dice")),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      // child: ClipRRect(
                      //   borderRadius: BorderRadius.circular(20.0),
                      //   child: Image.asset(
                      //     'assets/images/dice-six-faces-$rightdice.png',
                      //     // width: 200,
                      //     height: 200 - _controller.value * 200,
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                      child: Image(
                        height: 200 - (animation.value) * 200,
                        image: AssetImage(
                            'assets/images/dice-six-faces-$rightdice.png'),
                      ),
                    ),
                  ))
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 0, 0, 0)),
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(100, 50))),
                onPressed: roll,
                child: const Text(
                  "Roll",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
