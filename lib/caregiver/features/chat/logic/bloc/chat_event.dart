part of 'chat_bloc.dart';

sealed class CaregiverChatEvent extends Equatable {
  const CaregiverChatEvent();

  @override
  List<Object> get props => [];
}


class GetChatsEvent extends CaregiverChatEvent{
  const GetChatsEvent();
}

class CreateNewChatEvent extends CaregiverChatEvent {
  final int patientId;
  final int caregiverId;
  const CreateNewChatEvent(
      {required this.patientId, required this.caregiverId});
}
class GetChatMessages extends CaregiverChatEvent {
  final int chatId;
  final int page;
  const GetChatMessages(
      {required this.chatId, required this.page});
}

class SendNewMessageEvent extends CaregiverChatEvent {
  final String message;
  final String chatId;
  final String caregiverId;
  const SendNewMessageEvent({required this.message,required this.chatId,required this.caregiverId});
}
