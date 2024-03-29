import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:messenger_chat/chat/widgets/video_player_item.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';

class DisplayChatMessage extends StatelessWidget {
  const DisplayChatMessage({
    super.key,
    required this.message,
    required this.type,
  });
  final String message;
  final MessageEnum type;

  @override
  Widget build(BuildContext context) {
    bool isPlaying = false;
    final audioPlayer = AudioPlayer();
    return type == MessageEnum.text
        ? Text(
            message,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
          )
        : type == MessageEnum.video
            ? VideoPlayerItem(
                videoUrl: message,
              )
            : type == MessageEnum.audio
                ? StatefulBuilder(builder: (context, setState) {
                    return IconButton(
                      constraints: BoxConstraints(
                        minWidth: 100.w,
                      ),
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                          setState(
                            () {
                              isPlaying = false;
                            },
                          );
                        } else {
                          await audioPlayer.play(
                            UrlSource(message),
                          );
                          setState(
                            () {
                              isPlaying = true;
                            },
                          );
                        }
                      },
                      icon: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: Colors.white,
                      ),
                    );
                  })
                : CachedNetworkImage(
                    imageUrl: message,
                  );
  }
}
