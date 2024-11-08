import 'package:dochome/common/widgets/chat/chat_tile.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/chat/screens/single_chat/chat.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCaregiverChatTile extends StatelessWidget {
  const CustomCaregiverChatTile({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: context.read<ChatBloc>().chats.map((chatModel) {
        final caregiver = chatModel.participants.elementAt(0).caregiver;
        return ChatTile(
          lastMessage: chatModel.lastMessage ?? "no messages".tr,
          time: chatModel.lastMessageTime ?? "",
          image: caregiver.profileImage,
          name: caregiver.name,
          onTap: () {
            CHelperFunctions.navigateToScreen(
              context,
              SingleChatScreen(
                receiverId: caregiver.id.toString(),
                personName: caregiver.name,
                avatar: caregiver.profileImage,
                chatId: chatModel.id,
                userType: UserType.patient,

              ),
            );
          },
        );
      }).toList(),
    );
  }
}
