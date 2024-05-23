import 'dart:convert';

import 'package:dochome/common/widgets/chat/chat_appbar.dart';
import 'package:dochome/common/widgets/chat/message_widget.dart';
import 'package:dochome/common/widgets/chat/send_message_bottom_bar.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientSingleChatScreen extends StatefulWidget {
  const PatientSingleChatScreen({
    super.key,
    required this.caregiverId,
    required this.caregiverName,
    required this.avatar,
    required this.chatId,
  });
  final String caregiverId;
  final String caregiverName;
  final String avatar;
  final int chatId;

  @override
  State<PatientSingleChatScreen> createState() =>
      _PatientSingleChatScreenState();
}

class _PatientSingleChatScreenState extends State<PatientSingleChatScreen> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    context
        .read<PatientChatBloc>()
        .add(GetChatMessages(chatId: widget.chatId, page: currentPage));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientChatBloc>();
    return Scaffold(
      appBar: CChatAppBar(
        username: widget.caregiverName,
        image: widget.avatar,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<PatientChatBloc, ChatState>(
              listener: (context, state) {
                if (state is ChatFailureState) {
                  CHelperFunctions.showSnackBar(
                      context: context, message: state.message);
                }
              },
              builder: (context, state) {
                return state is LoadingChatMessagesState
                    ? const CLoadingWidget(
                        indicatorColor: CColors.primary,
                      )
                    : ListView(
                        reverse: true,
                        padding: const EdgeInsets.all(CSizes.defaultSpace),
                        children: context
                            .read<PatientChatBloc>()
                            .messages
                            .map(
                              (message) => MessageWidget(
                                message: message.message,
                                createdAt: message.time,
                                isMe: message.createdBy == "p",
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
                  message: bloc.messageController.text,
                  chatId: widget.chatId.toString(),
                  caregiverId: widget.caregiverId,
                ),
              );
            },
            controller: bloc.messageController,
          )
        ],
      ),
    );
  }
}
