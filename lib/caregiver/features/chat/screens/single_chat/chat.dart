import 'package:dochome/caregiver/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/common/widgets/chat/chat_appbar.dart';
import 'package:dochome/common/widgets/chat/message_widget.dart';
import 'package:dochome/common/widgets/chat/send_message_bottom_bar.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaregiverSingleChatScreen extends StatefulWidget {
  const CaregiverSingleChatScreen({
    super.key,
    required this.patientId,
    required this.patientName,
    required this.avatar,
    required this.chatId,
  });
  final String patientId;
  final String patientName;
  final String? avatar;
  final int chatId;

  @override
  State<CaregiverSingleChatScreen> createState() =>
      _CaregiverSingleChatScreenState();
}

class _CaregiverSingleChatScreenState extends State<CaregiverSingleChatScreen> {
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    context
        .read<CaregiverChatBloc>()
        .add(GetChatMessages(chatId: widget.chatId, page: currentPage));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CaregiverChatBloc>();
    return Scaffold(
      appBar: CChatAppBar(
        username: widget.patientName,
        image: widget.avatar,
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<CaregiverChatBloc, ChatState>(
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
                            .read<CaregiverChatBloc>()
                            .messages
                            .map(
                              (message) => MessageWidget(
                                message: message.message,
                                createdAt: message.time,
                                isMe: message.createdBy == "c",
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
                  caregiverId: widget.patientId,
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
