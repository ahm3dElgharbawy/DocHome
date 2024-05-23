import 'package:dochome/patient/features/chatbot/data/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

part 'chat_bot_state.dart';

class ChatBotCubit extends Cubit<ChatBotState> {
  ChatBotCubit() : super(ChatBotInitial());

  final ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();
  final gemini = Gemini.instance;
  final List<ChatBotMessage> messages = [];

  sendMessage() async {
    if (messageController.text.trim().isNotEmpty) {
      emit(ChatBotLoadingState());
      final String message = messageController.text;
      messages.add(ChatBotMessage(text: message, isSentByMe: true));
      messageController.clear(); // remove text from the input field
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      try {
        final result = await gemini.text(message);
        String responseTxt = result?.output ?? "";
        if (responseTxt.isNotEmpty) {
          messages.add(ChatBotMessage(text: responseTxt, isSentByMe: false));
        }
      } catch (e) {
        return emit(ChatBotFailureState());
      }
      emit(const ChatBotSuccessState());
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    messageController.dispose();
    return super.close();
  }
}
