part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class InitPusherEvent extends ChatEvent {}

class GetChatsEvent extends ChatEvent{
  const GetChatsEvent();
}

class CreateNewChatEvent extends ChatEvent {
  final int patientId;
  final int caregiverId;
  const CreateNewChatEvent(
      {required this.patientId, required this.caregiverId});
}
class GetChatMessages extends ChatEvent {
  final int chatId;
  final int page;
  const GetChatMessages(
      {required this.chatId, required this.page});
}

class SendNewMessageEvent extends ChatEvent {
  final String message;
  final String chatId;
  final String caregiverId;
  const SendNewMessageEvent({required this.message,required this.chatId,required this.caregiverId});
}
