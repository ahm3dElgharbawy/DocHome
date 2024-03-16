import 'package:dochome/common/widgets/chat/chat_tile.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/chat/screens/single_chat/chat.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PatientChatsScreen extends StatefulWidget {
  const PatientChatsScreen({super.key});

  @override
  State<PatientChatsScreen> createState() => _PatientChatsScreenState();
}

class _PatientChatsScreenState extends State<PatientChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(
        title: "Chats",
        centerTitle: true,
        showBackArrow: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Column(children: [
            const CTextFieldWithInnerShadow(
              hintText: "search..",
              margin: EdgeInsets.zero,
              prefixIcon: Icon(Icons.search),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            ChatTile(
              lastMessage: "hello there how are you",
              time: "7:20 PM",
              image: CImages.doc1,
              name: "Hoda Mohamed",
              unReadMessages: 3,
              onTap: () {
                CHelperFunctions.navigateToScreen(
                  context,
                  const PatientSingleChatScreen(
                    userId: '1',
                    userName: "Hoda Mohamed",
                    image: CImages.doc1,
                  ),
                );
              },
            ),
            const ChatTile(
              lastMessage: "thank you",
              time: "9:10 PM",
              image: CImages.doc2,
              name: "Essra Gamal",
              unReadMessages: 4,
            ),
            const ChatTile(
              lastMessage: "send me your x-ray please",
              time: "4:33 PM",
              image: CImages.doc3,
              name: "Ahmed Ali",
              unReadMessages: 5,
              isLastMessage: false,
            ),
          ]),
        ),
      ),
    );
  }
}
