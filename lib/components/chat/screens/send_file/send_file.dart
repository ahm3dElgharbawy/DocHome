import 'dart:io';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/text_fields/outlined_text_field.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file_plus/open_file_plus.dart';

class PatientSendFileScreen extends StatelessWidget {
  const PatientSendFileScreen(
      {super.key,
      required this.file,
      required this.chatId,
      required this.receiverId,
      required this.senderType});
  final File file;
  final String chatId;
  final String receiverId;
  final UserType senderType;

  @override
  Widget build(BuildContext context) {
    TextEditingController mediaDescriptionController = TextEditingController();
    MediaType fileType = CHelperFunctions.getMediaType(file.path);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          )
        ],
      ),
      body: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {
          if (state is MessageSentSuccessfullyState) {
            "Message send Successfully".showAsToast(Colors.green);
            Navigator.pop(context);
          } else if (state is ChatFailureState) {
            state.message.showAsToast(Colors.red);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: CRoundedContainer(
                      color: Colors.transparent,
                      radius: 10,
                      child: fileType == MediaType.image
                          ? Image.file(file)
                          : GestureDetector(
                              onTap: () async {
                                await OpenFile.open(file.path);
                              },
                              child: Image.asset(
                                CHelperFunctions.getMediaImage(fileType),
                                height: 150,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    child: CustomOutlinedTextField(
                      controller: mediaDescriptionController,
                      hintText: "Type a description...",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ChatBloc>().add(
                            SendNewMessageEvent(
                              message: mediaDescriptionController.text.isEmpty
                                  ? " "
                                  : mediaDescriptionController.text,
                              chatId: chatId,
                              receiverId: receiverId,
                              file: file,
                              senderType: senderType,
                            ),
                          );
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              )
            ]),
          );
        },
      ),
    );
  }
}
