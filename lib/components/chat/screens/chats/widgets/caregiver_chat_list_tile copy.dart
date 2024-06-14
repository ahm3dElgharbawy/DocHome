import 'package:dochome/common/widgets/chat/chat_tile.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/chat/screens/single_chat/chat.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPatientChatTile extends StatelessWidget {
  const CustomPatientChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: context.read<ChatBloc>().chats.map((chatModel) {
        final patient = chatModel.participants.elementAt(1).user;
        return ChatTile(
          lastMessage: chatModel.lastMessage ?? "no messages",
          time: chatModel.lastMessageTime ?? "",
          image: patient.avatar,
          name: patient.name,
          onTap: () {
            CHelperFunctions.navigateToScreen(
              context,
              SingleChatScreen(
                receiverId: patient.id.toString(),
                personName: patient.name,
                avatar: patient.avatar ?? "",
                chatId: chatModel.id,
                userType: UserType.caregiver,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
