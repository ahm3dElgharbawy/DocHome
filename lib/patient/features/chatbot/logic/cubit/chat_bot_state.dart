part of 'chat_bot_cubit.dart';

sealed class ChatBotState extends Equatable {
  const ChatBotState();

  @override
  List<Object> get props => [];
}

final class ChatBotInitial extends ChatBotState {}


final class ChatBotFailureState extends ChatBotState {}
final class ChatBotLoadingState extends ChatBotState {}
final class ChatBotSuccessState extends ChatBotState {
  const ChatBotSuccessState();

  @override
  List<Object> get props => [];
}

