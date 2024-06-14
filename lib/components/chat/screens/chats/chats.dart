import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/shimmers/chats_shimmer.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/chat/screens/chats/widgets/caregiver_chat_list_tile%20copy.dart';
import 'package:dochome/components/chat/screens/chats/widgets/patient_chat_list_tile.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key, required this.userType});
  final UserType userType;

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatBloc>().add(const GetChatsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(
        title: "Chats",
        centerTitle: true,
        showBackArrow: false,
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is SuccessLoadingChatsState) {
            print("Chats : ${state.chats}");
          }
          else if (state is ChatCreatedSuccessfullyState) {
            "success create the chat".showAsToast(Colors.green);
          }
          else if (state is ChatFailureState) {
            state.message.showAsToast(Colors.red);
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
                if(state is LoadingChatsState)
                    const CustomChatsLoadingShimmer(),
                if(state is SuccessLoadingChatsState)
                    widget.userType == UserType.patient ? const CustomCaregiverChatTile() : const CustomPatientChatTile()
                
              ]),
            ),
          );
        },
      ),
    );
  }
}
