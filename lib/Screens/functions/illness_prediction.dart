import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class IllnessPrediction extends StatefulWidget {
  const IllnessPrediction({super.key});

  @override
  State<IllnessPrediction> createState() => _IllnessPredictionState();
}

class _IllnessPredictionState extends State<IllnessPrediction> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  bool _firstSpeech = true;
  String _lastWords = '';
  double opacity = 0.0;
  double radius = 30.0;
  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {
      _lastWords = "";
      // radius = 30.0;
      // opacity = 1.0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      radius = 0.0;
      opacity = 0.0;
    });
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  bool isListening = false;

  void toggleListening() {
    setState(() {
      isListening = !isListening;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: const Color(0xFF161616),
        body: Stack(
          children: [
            Positioned.fill(
                child: Image.asset(
              "Assets/backgrounds/splasvoice.png",
              fit: BoxFit.cover,
            )),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  stretch: true,
                  pinned: true,
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.menu)),
                  backgroundColor: Colors.transparent,
                  title: const Text("Personal Assistant"),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(width / 20),
                    child: Column(
                      children: [
                        if (_firstSpeech)
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(23, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.circular(width / 20)),
                            child: Padding(
                              padding: EdgeInsets.all(width / 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "Assets/Logo/trans.png",
                                    height: 30,
                                    width: 30,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: AnimatedTextKit(
                                        isRepeatingAnimation: false,
                                        animatedTexts: [
                                          TyperAnimatedText(
                                              "Hello, I'm Nex, your personal assistant, Tell me your symptoms and I'll suggest your possible conditions",
                                              textStyle: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18)),
                                        ]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (_lastWords.isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(23, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.circular(width / 20)),
                            child: Padding(
                              padding: EdgeInsets.all(width / 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.graphic_eq_rounded,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    _lastWords,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ))
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: height / 1.3,
              // Adjust the position as needed
              left: width / 2 - 35, // Adjust the position as needed
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(119, 177, 246, 255),
                      spreadRadius: 2,
                      blurRadius: 0,
                      offset:
                          Offset(0, 0), // changes the position of the shadow
                    )
                  ],
                  color: Color.fromARGB(255, 209, 219, 222), // Your theme color
                ),
                child: IconButton(
                  onPressed: () {
                    _speechToText.isNotListening
                        ? _startListening()
                        : _stopListening();
                    if (_firstSpeech == true) {
                      setState(() {
                        _firstSpeech = false;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.graphic_eq_rounded,
                    color: Color.fromARGB(255, 3, 14, 32),
                    size: 36,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
