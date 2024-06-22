import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/empty_widget.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/shimmers/chats_shimmer.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/chat/screens/chats/widgets/patient_chat_list_tile.dart';
import 'package:dochome/components/chat/screens/chats/widgets/caregiver_chat_list_tile.dart';
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
      appBar: CMainAppBar(
        title: "Chats".tr,
        centerTitle: true,
        showBackArrow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, state) {
            if (state is SuccessLoadingChatsState) {
              // print("Chats : ${state.chats}");
            } else if (state is SuccessCreateChatState) {
              "Chat created successfully".tr.showAsToast(Colors.green);
            } else if (state is FailureChatState) {
              state.message.showAsToast(Colors.red);
            }
          },
          builder: (context, state) {
            if (state is LoadingChatsState) {
              return const CustomChatsLoadingShimmer();
            } else if (state is FailureChatState) {
              return CustomFailureWidget(onTap: () {});
            }
            return context.read<ChatBloc>().chats.isEmpty
                ? const CustomEmptyWidget()
                : SingleChildScrollView(
                    child: Column(children: [
                      // CTextFieldWithInnerShadow(
                      //   hintText: "search..,".tr,
                      //   margin: EdgeInsets.zero,
                      //   prefixIcon: const Icon(Icons.search),
                      // ),
                      // const SizedBox(height: CSizes.spaceBtwItems),
                      if (state is LoadingChatsState)
                        const CustomChatsLoadingShimmer(),
                      widget.userType == UserType.patient
                          ? const CustomCaregiverChatTile()
                          : const CustomPatientChatTile()
                    ]),
                  );
          },
        ),
      ),
    );
  }
}
