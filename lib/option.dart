import 'package:dice/home.dart';
import 'package:dice/solo.dart';
import 'package:flutter/material.dart';

class Option extends StatefulWidget {
  const Option({super.key});

  @override
  State<Option> createState() => _OptionState();
}

class _OptionState extends State<Option> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Image(
              image: AssetImage("assets/images/animated-dice-image-0020.gif")),
          const Padding(padding: EdgeInsets.all(20)),
          // const SizedBox(
          //   height: 6,
          // ),
          Material(
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 8,
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Solo()));
              },
              child: Ink.image(
                  colorFilter: const ColorFilter.mode(
                      Color.fromARGB(27, 0, 0, 0), BlendMode.srcATop),
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  image: const AssetImage(
                      "assets/images/istockphoto-525965136-612x612.jpg")),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          Material(
            borderRadius: BorderRadius.circular(28),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 8,
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Ink.image(
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                  image: const AssetImage(
                      "assets/images/two-dice-over-white-35282443.jpeg")),
            ),
          ),
        ]),
      ),
    ));
  }
}
