import 'dart:io';

import 'package:dochome/common/widgets/chat/chat_appbar.dart';
import 'package:dochome/common/widgets/chat/message_widget.dart';
import 'package:dochome/common/widgets/chat/send_message_bottom_bar.dart';
import 'package:dochome/common/widgets/shimmers/chat_messages_shimmer.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/chat/screens/send_file/send_file.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({
    super.key,
    required this.receiverId, // caregiver
    required this.personName,
    required this.avatar,
    required this.chatId,
    required this.userType,
  });
  final String receiverId;
  final String personName;
  final String avatar;
  final int chatId;
  final UserType userType;

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    context
        .read<ChatBloc>()
        .add(GetChatMessages(chatId: widget.chatId, page: currentPage));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();
    return Scaffold(
      appBar: CChatAppBar(
        username: widget.personName,
        image: widget.avatar,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<ChatBloc, ChatState>(
              listener: (context, state) {
                if (state is ChatFailureState) {
                  state.message.showAsToast(Colors.red);
                }
              },
              builder: (context, state) {
                return state is LoadingChatMessagesState
                    ? const CustomChatMessagesLoadingShimmer()
                    : ListView(
                        reverse: true,
                        padding: const EdgeInsets.all(CSizes.defaultSpace),
                        children: context
                            .read<ChatBloc>()
                            .messages
                            .map(
                              (message) => MessageWidget(
                                message: message.message,
                                createdAt: message.time,
                                isMe: widget.userType == UserType.patient &&
                                        message.createdBy == "p" ||
                                    widget.userType == UserType.caregiver &&
                                        message.createdBy == "c",
                                file: message.file,
                              ),
                            )
                            .toList(),
                      );
              },
            ),
          ),
          CSendMessageBottomBar(
            onSend: () {
              bloc.add(
                SendNewMessageEvent(
                  chatId: widget.chatId.toString(),
                  message: bloc.messageController.text,
                  receiverId: widget.receiverId,
                  file: null,
                  senderType: widget.userType
                ),
              );
            },
            onTapUpload: () async {
              File? pickedFile = await CHelperFunctions.pickFile();
              if (pickedFile != null && context.mounted) {
                context.push(
                  PatientSendFileScreen(
                    file: pickedFile,
                    chatId: widget.chatId.toString(),
                    receiverId: widget.receiverId,
                    senderType: widget.userType,
                  ),
                );
              }
            },
            controller: bloc.messageController,
          )
        ],
      ),
    );
  }
}
