import 'package:dochome/common/widgets/chat/chat_tile.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/shimmers/chats_shimmer.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/patient/features/chat/screens/single_chat/chat.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientChatsScreen extends StatefulWidget {
  const PatientChatsScreen({super.key});

  @override
  State<PatientChatsScreen> createState() => _PatientChatsScreenState();
}

class _PatientChatsScreenState extends State<PatientChatsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PatientChatBloc>().add(const GetChatsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(
        title: "Chats",
        centerTitle: true,
        showBackArrow: false,
      ),
      body: BlocConsumer<PatientChatBloc, ChatState>(
        listener: (context, state) {
          if (state is SuccessLoadingChatsState) {
            print("Chats : ${state.chats}");
          }
          if (state is ChatCreatedSuccessfullyState) {
            print("success create the chat");
          }
          if (state is ChatFailureState) {
            print(state.message);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: Column(children: [
                const CTextFieldWithInnerShadow(
                  hintText: "search..,",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.search),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                state is LoadingChatsState
                    ? const CustomChatsLoadingShimmer()
                    : Column(
                        children: context.read<PatientChatBloc>().chats.map((chatModel) {
                          final caregiver =
                              chatModel.participants.elementAt(0).caregiver;
                          return ChatTile(
                            lastMessage: chatModel.lastMessage ?? "no messages",
                            time: chatModel.lastMessageTime ?? "",
                            image: caregiver.profileImage,
                            name: caregiver.name,
                            onTap: () {
                              CHelperFunctions.navigateToScreen(
                                context,
                                PatientSingleChatScreen(
                                  caregiverId: caregiver.id.toString(),
                                  caregiverName: caregiver.name,
                                  avatar: caregiver.profileImage,
                                  chatId: chatModel.id,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
