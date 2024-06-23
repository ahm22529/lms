import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:open/fetures/cha/services/assets_manager.dart';

import 'text_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    Key? key,
    required this.msg,
    required this.chatIndex,
    required this.shouldAnimate,
  }) : super(key: key);

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: chatIndex == 0 ? Colors.white : Color(0xff3B82F6),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0 ? AssetsManager.userImage : AssetsManager.botImage,
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: chatIndex == 0
                      ? TextWidget(label: msg)
                      : shouldAnimate
                          ? DefaultTextStyle(
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                              child: AnimatedTextKit(
                                isRepeatingAnimation: false,
                                repeatForever: false,
                                displayFullTextOnTap: true,
                                totalRepeatCount: 1,
                                animatedTexts: [
                                  TyperAnimatedText(msg.trim()),
                                ],
                              ),
                            )
                          : Text(
                              msg.trim(),
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                ),
                if (chatIndex != 0)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _convertTextToSpeech(context, msg.trim()),
                        icon: const Icon(Icons.volume_up, color: Colors.white),
                      ),
                      const SizedBox(width: 5),
                      Icon(Icons.thumb_down_alt_outlined, color: Colors.white),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _convertTextToSpeech(BuildContext context, String text) async {
    final flutterTts = FlutterTts();
    await flutterTts.setSharedInstance(true);
    await flutterTts.speak(text);
  }
}
