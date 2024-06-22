part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

// create new chat
final class LoadingCreateChatState extends ChatState {}
final class SuccessCreateChatState extends ChatState {}
final class FailureCreateChatState extends ChatState {
  final String message;
  const FailureCreateChatState({required this.message});
}

// =========================( chats screen )=================================
final class LoadingChatsState extends ChatState {}
final class SuccessLoadingChatsState extends ChatState {
  final List<Chat> chats;
  const SuccessLoadingChatsState({required this.chats});
  @override
  List<Object> get props => [chats];
}
final class FailureChatState extends ChatState {
  final String message;
  const FailureChatState({required this.message});
}

// =========================( chat messages )===============================

final class LoadingChatMessagesState extends ChatState {}
// success
final class SuccessLoadingChatMessagesState extends ChatState {
  final List<MessageModel> messages;
  const SuccessLoadingChatMessagesState({required this.messages});
}
final class FailureLoadingChatMessagesState extends ChatState {
  final String message;
  const FailureLoadingChatMessagesState({required this.message});
}

// ========================( send message )=================================
final class LoadingSendMessageState extends ChatState {
  const LoadingSendMessageState();
  @override
  List<Object> get props => [];
}
final class SuccessSendMessageState extends ChatState {
  final MessageModel message;
  const SuccessSendMessageState({required this.message});
  @override
  List<Object> get props => [message];
}
final class FailureSendMessageState extends ChatState {
  final String message;
  const FailureSendMessageState({required this.message});
  @override
  List<Object> get props => [message];
}
