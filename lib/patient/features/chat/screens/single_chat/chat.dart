import 'package:dochome/common/widgets/chat/chat_appbar.dart';
import 'package:dochome/common/widgets/chat/message_widget.dart';
import 'package:dochome/common/widgets/chat/send_message_bottom_bar.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PatientSingleChatScreen extends StatelessWidget {
  const PatientSingleChatScreen({
    super.key,
    required this.userId,
    required this.userName,
    required this.image,
  });
  final String userId;
  final String userName;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CChatAppBar(username: userName, image: image),
      body: Column(
        children: [
          Expanded(
            child: ListView(
                reverse: false,
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                children: const [
                  MessageWidget(
                      message: "Dr. Hoda, I need help reading the prescription",
                      createdAt: "12:10 PM",
                      isMe: true),
                  MessageWidget(
                      message: "Are you with me now?",
                      createdAt: "12:10 PM",
                      isMe: false),
                  MessageWidget(
                      message: "Yes, with me",
                      createdAt: "12:10 PM",
                      isMe: true),
                  MessageWidget(
                      message: "Send me a picture of the prescription",
                      createdAt: "12:10 PM",
                      isMe: false),
                ]),
          ),
          const CSendMessageBottomBar()
        ],
      ),
    );
  }
}
