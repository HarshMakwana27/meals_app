import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:ui' as ui;

import 'package:meals_app/screens/tab_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        generateBluredImage(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.blur_linear_sharp,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    'Hungry',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    'U',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 33,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                'assets/images/burger.png',
                height: 225,
              ),
              const SizedBox(
                height: 40,
              ),
              Text('Embrace The Taste Adventure\nExplore - Cook - Enjoy',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreya(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 15,
              ),
              const Text('---', style: TextStyle(color: Colors.white)),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'The food Recipe App for All',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const TabScreen())));
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 100),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  // disabledBackgroundColor: Colors.amber,
                  // disabledForegroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  animationDuration: const Duration(seconds: 1),
                ),
                child: const Text(
                  'Get Started',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

Widget generateBluredImage() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/backSplash.avif'),
        fit: BoxFit.cover,
      ),
    ),
    //I blured the parent container to blur background image, you can get rid of this part
    child: BackdropFilter(
      filter: ui.ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
      child: Container(
        //you can change opacity with color here(I used black) for background.
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
      ),
    ),
  );
}
