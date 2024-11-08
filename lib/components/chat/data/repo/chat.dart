import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dochome/components/chat/data/models/chat.dart';
import 'package:dochome/components/chat/data/models/message.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:http/http.dart';

abstract class ChatRepo {
  Future<Either<Failure, Unit>> newChat(
      {required int patientId, required int caregiverId});
  Future<Either<Failure, List<Chat>>> allChats(); // : List<ChatModel>
  Future<Either<Failure, MessageModel>> addMessage({
    required String message,
    required String chatId,
    required String receiverId,
    File? file,
    required UserType senderType
  });
  Future<Either<Failure, List<MessageModel>>> allMessage(
      {required int chatId, required int page}); // : List<Message>
}

class ChatRepoImpl implements ChatRepo {
  final NetworkInfo networkInfo;
  const ChatRepoImpl({required this.networkInfo});

  @override
  Future<Either<Failure, MessageModel>> addMessage(
      {required message, required chatId, required receiverId, file,required senderType}) async {
    Map<String,String> body = {
      "message": message,
      "chat_id": chatId,
      "receiver_id": receiverId,
      "created_by": senderType == UserType.caregiver ? "c" : "p",
    };
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => file != null
          ? ApiCalls.postDataWithFiles(EndPoints.addChatMessage, body, {"file" : file})
          : ApiCalls.postData(
              EndPoints.addChatMessage,
              body
            ),
    );

    return result.fold((failure) => left(failure), (response) {
      MessageModel message = MessageModel.fromJson(jsonDecode(response.body)['data']);
      return right(message);
    });
  }

  @override
  Future<Either<Failure, List<Chat>>> allChats() async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.getAllChats),
    );

    return result.fold((failure) => left(failure), (response) {
      final List allChats = jsonDecode(response.body)['data'];
      List<Chat> chats = allChats.map((chat) => Chat.fromJson(chat)).toList();
      return right(chats);
    });
  }

  @override
  Future<Either<Failure, List<MessageModel>>> allMessage(
      // todo add message model
      {required int chatId,
      required int page}) async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.getData(
          '${EndPoints.getChatMessages}?chat_id=$chatId&page=$page'),
    );

    return result.fold((failure) => left(failure), (response) {
      print(jsonDecode(response.body));
      List messages = jsonDecode(response.body)['data'];
      print(messages);
      List<MessageModel> all =
          messages.map((message) => MessageModel.fromJson(message)).toList();
      return right(all);
    });
  }

  @override
  Future<Either<Failure, Unit>> newChat(
      {required int patientId, required int caregiverId}) async {
    Either<Failure, Response> result = await ResponseHandler.handle(
      () => ApiCalls.postData(EndPoints.createNewChat,
          {'user_id': patientId, 'caregiver_id': caregiverId}),
    );

    return result.fold((failure) => left(failure), (response) {
      return right(unit);
    });
  }
}
