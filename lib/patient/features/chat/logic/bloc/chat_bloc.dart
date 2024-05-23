import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/chat/data/models/chat.dart';
import 'package:dochome/patient/features/chat/data/models/message.dart';
import 'package:dochome/patient/features/chat/data/repo/chat.dart';
import 'package:dochome/utils/constants/app_keys.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class PatientChatBloc extends Bloc<ChatEvent, ChatState> {
  PatientChatRepo repoImpl;
  List<MessageModel> messages = [];
  List<Chat> chats = [];
  TextEditingController messageController = TextEditingController();
  PatientChatBloc({required this.repoImpl}) : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is InitPusherEvent) {
        try {
          PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();
          await pusher.init(
              apiKey: AppKeys.pusherAppKey, cluster: AppKeys.pusherCluster);
          await pusher.connect();
        } catch (e) {
          emit(ChatFailureState(message: e.toString()));
        }
      } else if (event is CreateNewChatEvent) {
        emit(LoadingChatsState()); // todo make new state for this event
        Either<Failure, Unit> failureOrSuccess = await repoImpl.newChat(
            patientId: event.patientId, caregiverId: event.caregiverId);
        failureOrSuccess.fold(
          (failure) => emit(ChatFailureState(message: failure.message)),
          (r) => emit(
            ChatCreatedSuccessfullyState(),
          ),
        );
      } else if (event is GetChatsEvent) {
        emit(LoadingChatsState());
        Either<Failure, List<Chat>> failureOrSuccess =
            await repoImpl.allChats();
        failureOrSuccess.fold(
          (failure) => emit(ChatFailureState(message: failure.message)),
          (allChats) {
            chats.clear();
            chats = allChats;
            emit(
              SuccessLoadingChatsState(chats: chats),
            );
          },
        );
      } else if (event is GetChatMessages) {
        emit(LoadingChatMessagesState());
        Either<Failure, List<MessageModel>> failureOrSuccess =
            await repoImpl.allMessage(chatId: event.chatId, page: event.page);
        failureOrSuccess.fold(
          (failure) => emit(ChatFailureState(message: failure.message)),
          (allMessages) {
            messages = allMessages;
            emit(
              SuccessLoadingChatMessagesState(messages: messages),
            );
          },
        );
      } else if (event is SendNewMessageEvent && messageController.text.trim().isNotEmpty) {
        messageController.clear();
        Either<Failure, MessageModel> failureOrSuccess =
            await repoImpl.addMessage(
          message: event.message,
          chatId: event.chatId,
          caregiverId: event.caregiverId,
        );
        failureOrSuccess.fold(
          (failure) => emit(ChatFailureState(message: failure.message)),
          (message) {
            messages.insert(0,message);
            emit(
              MessageSentSuccessfullyState(message: message),
            );
          },
        );
      }
    });
  }
}
