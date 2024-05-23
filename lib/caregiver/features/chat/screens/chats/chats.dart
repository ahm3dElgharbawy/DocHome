import 'package:dochome/caregiver/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/caregiver/features/chat/screens/single_chat/chat.dart';
import 'package:dochome/common/widgets/chat/chat_tile.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaregiverChatsScreen extends StatefulWidget {
  const CaregiverChatsScreen({super.key});

  @override
  State<CaregiverChatsScreen> createState() => _CaregiverChatsScreenState();
}

class _CaregiverChatsScreenState extends State<CaregiverChatsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CaregiverChatBloc>().add(const GetChatsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(
        title: "Chats",
        centerTitle: true,
        showBackArrow: false,
      ),
      body: BlocConsumer<CaregiverChatBloc, ChatState>(
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
                  hintText: "search..",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.search),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                state is LoadingChatsState
                    ? const CLoadingWidget(indicatorColor: CColors.primary)
                    : Column(
                        children: context
                            .read<CaregiverChatBloc>()
                            .chats
                            .map((chatModel) {
                          final patient =
                              chatModel.participants.elementAt(0).user;
                          return ChatTile(
                            lastMessage: chatModel.lastMessage ?? "no messages",
                            time: chatModel.lastMessageTime ?? "",
                            image: patient.avatar,
                            name: patient.name,
                            onTap: () {
                              CHelperFunctions.navigateToScreen(
                                context,
                                CaregiverSingleChatScreen(
                                  patientId: patient.id.toString(),
                                  patientName: patient.name,
                                  avatar: patient.avatar,
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
