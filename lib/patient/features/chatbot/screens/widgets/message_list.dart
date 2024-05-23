import 'package:dochome/common/widgets/chat/message_widget.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/chatbot/data/models/model.dart';
import 'package:dochome/patient/features/chatbot/logic/cubit/chat_bot_cubit.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBotMessagesList extends StatelessWidget {
  const ChatBotMessagesList(
      {super.key, required this.scrollController, required this.messages});
  final ScrollController scrollController;
  final List<ChatBotMessage> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...messages.map(
              (message) => MessageWidget(
                message: message.text,
                isMe: message.isSentByMe,
              ),
            ),
            Row(
              children: [
                BlocBuilder<ChatBotCubit, ChatBotState>(
                  builder: (context, state) {
                    if (state is ChatBotLoadingState) {
                      return const CRoundedContainer(
                        color: CColors.grey,
                        width: 50,
                        margin: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.more_horiz_rounded,
                          size: 30,
                        ),
                      );
                    }
                    if (state is ChatBotFailureState) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.error,
                          size: 25,
                          color: Colors.red,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
