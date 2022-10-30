import 'package:flutter/material.dart';
import 'package:messenger_chat/status/domain/statusModel/status_model.dart';
import 'package:story_view/story_view.dart';

class StatusViewedPage extends StatefulWidget {
  final StatusModel status;
  const StatusViewedPage({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  State<StatusViewedPage> createState() => _StatusViewedPageState();
}

class _StatusViewedPageState extends State<StatusViewedPage> {
  StoryController controller = StoryController();
  List<StoryItem> storyItems = [];

  @override
  void initState() {
    super.initState();
    initStoryPageItems();
  }

  void initStoryPageItems() {
    for (int i = 0; i < widget.status.photoUrl.length; i++) {
      storyItems.add(
        StoryItem.pageImage(
          url: widget.status.photoUrl[i],
          controller: controller,
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: storyItems.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : StoryView(
                storyItems: storyItems,
                controller: controller,
                onVerticalSwipeComplete: (direction) {
                  if (direction == Direction.down) {
                    Navigator.pop(context);
                  }
                },
              ),
      ),
    );
  }
}
