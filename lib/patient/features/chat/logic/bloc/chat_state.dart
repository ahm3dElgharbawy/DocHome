part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

// loading
final class LoadingChatsState extends ChatState {}

final class LoadingChatMessagesState extends ChatState {}

// success
final class SuccessLoadingChatMessagesState extends ChatState {
  final List<MessageModel> messages;
  const SuccessLoadingChatMessagesState({required this.messages});
}

final class SuccessLoadingChatsState extends ChatState {
  final List<Chat> chats;
  const SuccessLoadingChatsState({required this.chats});
  @override
  List<Object> get props => [chats];
}

final class ChatCreatedSuccessfullyState extends ChatState {}

final class MessageSentSuccessfullyState extends ChatState {
  final MessageModel message;
  const MessageSentSuccessfullyState({required this.message});
  @override
  List<Object> get props => [message];
}

// failure
final class ChatFailureState extends ChatState {
  final String message;
  const ChatFailureState({required this.message});
}
