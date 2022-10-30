import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:messenger_chat/chat/shared/providers.dart';
import 'package:messenger_chat/core/shared/message_enum.dart';
import 'package:messenger_chat/core/shared/providers.dart';
import 'package:messenger_chat/core/utils/app_constant.dart';
import 'package:messenger_chat/core/widgets/message_reply_preview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class InteractiveMessageBottomField extends ConsumerStatefulWidget {
  const InteractiveMessageBottomField({
    Key? key,
    required this.receiverUserId,
    required this.isGroupChat,
  }) : super(key: key);
  final String receiverUserId;
  final bool isGroupChat;

  @override
  ConsumerState<InteractiveMessageBottomField> createState() =>
      _InteractiveMessageBottomFieldState();
}

class _InteractiveMessageBottomFieldState
    extends ConsumerState<InteractiveMessageBottomField> {
  bool isChanged = false;
  bool isShowEmojiContainer = false;
  final messageController = TextEditingController();
  var focusNode = FocusNode();
  FlutterSoundRecorder? soundRecorder;
  bool isRecorderInitialize = false;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    soundRecorder = FlutterSoundRecorder();
    openAudio();
  }

  void openAudio() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException(
        "Mic permission not granted",
      );
    }
    await soundRecorder!.openRecorder();
    isRecorderInitialize = true;
  }

  void hideEmojiContainer() {
    setState(() {
      isShowEmojiContainer = false;
    });
  }

  void showEmojiContainer() {
    setState(() {
      isShowEmojiContainer = true;
    });
  }

  void showKeyboard() {
    return focusNode.requestFocus();
  }

  void hideKeyboard() {
    return focusNode.unfocus();
  }

  void toggleEmojiKeyboardContainer() {
    if (isShowEmojiContainer) {
      showKeyboard();
      hideEmojiContainer();
    } else {
      showEmojiContainer();
      hideKeyboard();
    }
  }

  void sendMessage() async {
    if (isChanged) {
      ref.read(chatNotifierProvider).sendTextMessage(
            context,
            messageController.text.trim(),
            widget.receiverUserId,
            widget.isGroupChat,
          );
      setState(() {
        messageController.text = '';
      });
    } else {
      var tempDir = await getTemporaryDirectory();
      var path = '${tempDir.path}/flutter_sound.aac';
      if (!isRecorderInitialize) {
        return;
      }
      if (isRecording) {
        await soundRecorder!.stopRecorder();
        sendFileMessage(
          File(path),
          MessageEnum.audio,
        );
      } else {
        await soundRecorder!.startRecorder(
          toFile: path,
        );
      }

      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  void sendFileMessage(
    File file,
    MessageEnum messageEnum,
  ) {
    ref.read(chatNotifierProvider).sendFileMessage(
          context,
          file,
          widget.receiverUserId,
          messageEnum,
          widget.isGroupChat,
        );
  }

  void selectImage() async {
    File? image = await AppConstant.pickImageFromGallery(context);
    if (image != null) {
      sendFileMessage(
        image,
        MessageEnum.image,
      );
    }
  }

  void selectVideo() async {
    File? video = await AppConstant.pickVideoFromGallery(context);
    if (video != null) {
      sendFileMessage(
        video,
        MessageEnum.video,
      );
    }
  }

  // void selectGIF() async {
  //   GiphyGif? gif = await AppConstant.pickGIF(context);
  //   if (gif != null) {}
  // }

  @override
  void dispose() {
    messageController.dispose();
    soundRecorder!.closeRecorder();
    isRecorderInitialize = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageReply = ref.watch(messageReplyProvider);
    final isShowMessageReply = messageReply != null;
    return Column(
      children: [
        isShowMessageReply
            ? const MessageReplyPreviewWidget()
            : const SizedBox(),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: focusNode,
                  controller: messageController,
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      setState(() {
                        isChanged = true;
                      });
                    } else {
                      setState(() {
                        isChanged = false;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 210, 210, 210),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                      ),
                      child: SizedBox(
                        width: 43.h,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: toggleEmojiKeyboardContainer,
                              icon: const Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.black,
                              ),
                            ),

                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const Icon(
                            //     Icons.gif,
                            //     color: Colors.black,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    suffixIcon: Container(
                      width: 90.w,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: selectImage,
                            icon: const Icon(
                              CupertinoIcons.camera,
                              color: Colors.black,
                            ),
                          ),
                          IconButton(
                            onPressed: selectVideo,
                            icon: const Icon(
                              CupertinoIcons.videocam,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Type a message!',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(
                      10.sm,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 8.h,
                  right: 2.w,
                  left: 2.w,
                ),
                child: CircleAvatar(
                  backgroundColor: AppConstant.primaryColor,
                  radius: 25,
                  child: GestureDetector(
                    onTap: sendMessage,
                    child: Icon(
                      isChanged
                          ? Icons.send
                          : isRecording
                              ? Icons.close
                              : Icons.mic,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        isShowEmojiContainer
            ? SizedBox(
                height: 310,
                child: EmojiPicker(
                  onEmojiSelected: ((category, emoji) {
                    setState(() {
                      messageController.text =
                          messageController.text + emoji.emoji;
                    });

                    if (!isChanged) {
                      setState(() {
                        isChanged = true;
                      });
                    }
                  }),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
