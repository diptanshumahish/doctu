import 'package:flutter/foundation.dart';
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
      radius = 30.0;
      opacity = 1.0;
    });
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      radius = 0.0;
      opacity = 0.0;
    });
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          backgroundColor: Colors.transparent,
          title: Text("Doctu Assistant"),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(width / 20),
            child: SizedBox(
              height: height,
              width: width,
              child: Stack(
                children: [
                  Positioned(
                      right: 0,
                      left: 0,
                      child: Row(
                        children: [
                          const CircleAvatar(),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              _lastWords,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  Positioned(
                      top: height / 2,
                      left: 0,
                      right: 0,
                      child: Opacity(
                        opacity: opacity,
                        child: Container(
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.circular(width / 15)),
                            child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: _speechToText.isListening
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Listening, speak now",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            _lastWords,
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black87),
                                          )
                                        ],
                                      )
                                    : _speechEnabled
                                        ? Center(
                                            child: _lastWords.isEmpty &&
                                                    _speechToText.isNotListening
                                                ? const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Hello",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        "Tap the microphone to start listening",
                                                        style: TextStyle(
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox())
                                        : const Text("Speech not available"))),
                      )),
                  Positioned(
                      left: 0,
                      right: 0,
                      top: height / 1.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF7921F3),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blueAccent.withOpacity(0.4),
                                  blurRadius: 0,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  _speechToText.isNotListening
                                      ? _startListening()
                                      : _stopListening();
                                  if (kDebugMode) {
                                    print(_speechToText.isNotListening);
                                  }
                                },
                                borderRadius: BorderRadius.circular(40),
                                child: const Center(
                                  child: Icon(
                                    Icons.mic,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
