import 'package:dochome/patient/features/chatbot/logic/cubit/chat_bot_cubit.dart';
import 'package:dochome/patient/features/chatbot/screens/widgets/chatbot_text_field.dart';
import 'package:dochome/patient/features/chatbot/screens/widgets/message_list.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _ChatBotScreenState();
  }
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatBotCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Chatbot'.tr,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff343541),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocConsumer<ChatBotCubit, ChatBotState>(
              listener: (context, state) {
              },
              builder: (context, state) {
                return Expanded(
                  child: Column(
                    children: [
                      ChatBotMessagesList(
                        scrollController: cubit.scrollController,
                        messages: context.read<ChatBotCubit>().messages,
                      ),
                    ],
                  ),
                );
              },
            ),
            ChatBotTextField(
              onSend: () {
                cubit.sendMessage();
              },
              controller: cubit.messageController,
            )
          ],
        ),
      ),
    );
  }
}
